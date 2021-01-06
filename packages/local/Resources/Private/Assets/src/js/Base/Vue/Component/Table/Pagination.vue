<template>
    <nav class="pagination__wrapper">
        <ul class="pagination" v-if="response && response.view && response.view.pages.length > 1">
            <li class="page-item" :class="{ 'disabled': !response.view.hasPrev }">
                <a class="page-link" href="#" @click="loadPrevPage($event)">
                    <i class="fas fa-chevron-left"></i>
                </a>
            </li>
            <li class="page-item"
                v-if="response.view.pages"
                v-for="(page, index) in response.view.pages"
                :class="{ 'active': response.view.page === (index + 1) }"
            >
                <a class="page-link" href="#" @click="loadPage(index, $event)">{{ (index + 1) }}</a>
            </li>
            <li class="page-item" :class="{ 'disabled': !response.view.hasNext }">
                <a class="page-link" href="#" @click="loadNextPage($event)">
                    <i class="fas fa-chevron-right"></i>
                </a>
            </li>
        </ul>

        <div class="pagination__item-per-page" v-if="itemsPerPageOptions.length">
            <a href="#"
               class="pagination__item-per-page__item"
               :class="{ 'pagination__item-per-page__item--active': filter.itemsPerPage === itemsPerPageOption}"
               v-for="itemsPerPageOption in itemsPerPageOptions"
               @click="changeItemsPerPage(itemsPerPageOption, $event)"
            >
                {{ itemsPerPageOption }}
            </a>
        </div>
    </nav>
</template>
<script lang="ts">
import { Component, Emit, Prop } from 'vue-property-decorator';
import BaseComponent from '../BaseComponent';
import AbstractRestService from '../../../Api/AbstractRestService';
import Params from '../../../Api/Params';
import HydraResponse from '../../../Api/HydraResponse';
import AbstractModel from '../../../Api/Model/AbstractModel';


@Component
export default class Pagination
    extends BaseComponent
{

    @Prop()
    public service : AbstractRestService;

    @Prop()
    public filter : Params;

    @Prop({ default: [] })
    public itemsPerPageOptions : number[];

    public get response() : HydraResponse | null
    {
        return (this.service && this.service.lastCollectionResponse) || null;
    }

    @Emit()
    public beforePageChange() {}

    @Emit()
    public afterPageChange(response : AbstractModel[])
    {
        return response;
    }

    @Emit('afterChangeItemsPerPage')
    public changeItemsPerPage(itemsPerPage : Number, event : Event)
    {
        event && event.preventDefault();

        this.filter.resetPage();
        this.filter.itemsPerPage = itemsPerPage;
    }

    public loadNextPage(event : Event)
    {
        event && event.preventDefault();
        this.beforePageChange();
        this.service.fetchCollectionNextPage()
            .then(items => this.afterPageChange(items));
    }

    public loadPrevPage(event : Event)
    {
        event && event.preventDefault();
        this.beforePageChange();
        this.service.fetchCollectionPrevPage()
            .then(items => this.afterPageChange(items));
    }

    public loadPage(pageIndex : Number, event : Event)
    {
        event && event.preventDefault();
        this.beforePageChange();
        this.filter.pageIndex = pageIndex;
        this.service.fetchCollectionPage(pageIndex)
            .then(items => this.afterPageChange(items));
    }

}
</script>
