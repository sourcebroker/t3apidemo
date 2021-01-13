<template>
    <div class="m-table">
        <div class="row">
            <div class="col-md-6">
                <h2 class="m-section__title" v-if="header">{{ header }}</h2>
            </div>
            <div class="col-md-6">
                <div class="input-group input-group-md" v-if="searchEnabled">
                    <input type="text" class="form-control m-table__search" v-model="_params.search" @input="loadRecords(400)" :placeholder="searchPlaceholder"/>
                    <i class="fas fa-search m-table__search-icon"></i>
                </div>
            </div>
        </div>

        <div class="m-table__inner">
            <div v-if="isLoading">
                <div class="m-table__overlay"></div>
                <div class="m-table__loader fa-3x">
                    <i class="fas fa-circle-notch fa-spin"></i>
                </div>
            </div>

            <p v-if="!isLoading && records && !records.length">
                {{ messageNoResults }}
            </p>

            <table class="m-table__table mt-4" v-if="records && records.length" :class="{ 'm-table__table--selectable': selectable }">
                <thead>
                <tr>
                    <th v-if="selectable" class="m-table__table__col--selection">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" @change="toggleSelectAll()" id="v-table-select-all" :checked="areAllItemsSelected()"/>
                            <label class="form-check-label form-check-label--bordered-light form-check-label--thin" for="v-table-select-all"></label>
                        </div>
                    </th>
                    <th v-for="(column, index) in columns" :class="'m-table__table__col--index-' + index">
                        <button class="m-table__btn-order" @click="toggleOrder(column.property)" v-if="column.sortable">
                            {{ column.label }}
                            <i class="fas fa-caret-up" v-if="_params.order.isSortingBy(column.property, 'asc')"></i>
                            <i class="fas fa-caret-down" v-if="_params.order.isSortingBy(column.property, 'desc')"></i>
                        </button>
                        <template v-if="!column.sortable">
                            {{ column.label }}
                        </template>
                    </th>
                </tr>
                </thead>
                <tbody>
                <tr v-for="(record, index) in records" @click="selectable ? toggleSelect(record) : null">
                    <td v-if="selectable">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" @change="toggleSelect(record)" :id="'v-table-select-' + index" :checked="selectedRecords.has(record[recordsTrackBy])"/>
                            <label class="form-check-label form-check-label--bordered-light form-check-label--thin" :for="'v-table-select-' + index" @click="$event.stopPropagation()"></label>
                        </div>
                    </td>
                    <td v-for="column in columns">
                        <slot :record="record" :name="'cell:' + column.property">
                            {{ getNestedPropertyValue(column.property, record) }}
                        </slot>
                    </td>
                </tr>
                </tbody>
            </table>

            <slot :name="'underTable'"></slot>

            <div class="mt-4" v-if="records && records.length">
                <Pagination @beforePageChange="beforeLoadRecords()"
                            @afterPageChange="afterLoadRecords($event)"
                            @afterChangeItemsPerPage="loadRecords()"
                            :itemsPerPageOptions="itemsPerPageOptions"
                            :service="service"
                            :filter="_params"
                ></Pagination>
            </div>
        </div>
    </div>
</template>
<script lang="ts">
import Params from 'Base/Api/Params';
import AbstractService from '../../../Api/AbstractService';
import { Component, Emit, Prop, PropSync } from 'vue-property-decorator';
import BaseComponent from '../BaseComponent';
import AbstractModel from '../../../Api/Model/AbstractModel';
import Pagination from './Pagination.vue';


export type Column = {
    label : string,
    sortable : boolean,
    property : string,
};

@Component({
    components: {
        Pagination
    }
})
export default class VTable
    extends BaseComponent
{

    @Prop()
    public readonly service : AbstractService;

    @Prop()
    public readonly header : string;

    @PropSync('params')
    public readonly _params : object;

    @Prop()
    public readonly columns : Column[];

    @Prop()
    public readonly loadRecordsFunction : Function;

    @Prop({ default: () => [20, 50, 100] })
    public readonly itemsPerPageOptions : number[];

    @Prop({ default: false })
    public readonly selectable : boolean;

    @Prop({ default: () => [] })
    public readonly preselectedRecords : any[];

    @Prop({ default: true })
    public readonly searchEnabled : boolean;

    @Prop({ default: 'uid' })
    public readonly recordsTrackBy : string;

    @Prop({ default: false })
    public readonly forceIsLoadingState : boolean;

    @Prop({ default: 'Search' })
    public readonly searchPlaceholder : string;

    @Prop({ default: 'Could not find records matching your criteria.' })
    public readonly messageNoResults : string;

    public isLoadInProgress : boolean = false;

    public debounceLoadHandler : any = null;

    public records : AbstractModel[] = [];

    public selectedRecords : Map<Number | String, AbstractModel>;

    public get isLoading()
    {
        return this.forceIsLoadingState || this.isLoadInProgress;
    }

    protected mounted()
    {
        const records = this.preselectedRecords
            .map(record => [this.getRecordTrackingProperty(record), record]);
        this.selectedRecords = new Map(records);

        this.loadRecords();
    }

    public loadRecords(debounceTime = undefined)
    {
        if (typeof debounceTime !== 'undefined') {
            if (this.debounceLoadHandler !== null) {
                clearTimeout(this.debounceLoadHandler);
            }
            this.debounceLoadHandler = setTimeout(this.loadRecords, debounceTime);
            return;
        }

        this.beforeLoadRecords();

        this._params.resetPage();
        this.loadRecordsFunction().then(records => this.afterLoadRecords(records));
    }

    public beforeLoadRecords()
    {
        this.isLoadInProgress = true;
    }

    public afterLoadRecords(records : AbstractModel[])
    {
        this.records = records;
        this.isLoadInProgress = false;
    }

    public toggleOrder(property: string)
    {
        this._params.order.toggle(property);
        this.loadRecords();
    }

    public toggleSelectAll()
    {
        if (this.areAllItemsSelected()) {
            this.records.forEach(record => this.selectedRecords.delete(this.getRecordTrackingProperty(record)));
        }
        else {
            this.records.forEach(record => this.selectedRecords.set(this.getRecordTrackingProperty(record), record));
        }
        this.$forceUpdate();
        this.emitSelectionChanged();
    }

    public toggleSelect(record: AbstractModel)
    {
        if (this.selectedRecords.has(this.getRecordTrackingProperty(record))) {
            this.selectedRecords.delete(this.getRecordTrackingProperty(record));
        }
        else {
            this.selectedRecords.set(this.getRecordTrackingProperty(record), record);
        }
        this.$forceUpdate();
        this.emitSelectionChanged();
    }

    public areAllItemsSelected(): boolean
    {
        return this.records.every(record => this.selectedRecords.has(this.getRecordTrackingProperty(record)));
    }

    @Emit('selectionChanged')
    public emitSelectionChanged()
    {
        return Array.from(this.selectedRecords.values());
    }

    public getRecordTrackingProperty(record : AbstractModel)
    {
        return this.getNestedPropertyValue(this.recordsTrackBy, record);
    }

    /**
     * https://stackoverflow.com/a/6394168/1588346
     */
    public getNestedPropertyValue(path : string, object : Object): any
    {
        return path.split('.').reduce((o, i) => (typeof o !== 'undefined' ? o : {})[i], object);
    }
}
</script>
