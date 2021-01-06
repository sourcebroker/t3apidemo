<template>
    <VTable
        :service="service"
        :params="params"
        :columns="columns"
        :load-records-function="loadNews"
        header="News"
        search-placeholder="Search news"
        message-no-results="Could not find news matching your criteria."
    />
</template>
<script lang="ts">
import { Component } from 'vue-property-decorator';
import BaseComponent from 'Base/Vue/Component/BaseComponent';
import VTable, { Column } from 'Base/Vue/Component/Table/VTable';
import Params from 'Base/Api/Params';
import NewsService from '../Service/NewsService';


@Component({
    components: {
        VTable
    }
})
export default class List
    extends BaseComponent
{

    public static MOUNT_ON = '.js-news-list';

    public service : NewsService = new NewsService();

    public params : Params = new Params();

    public columns : Column[] = [
        {
            label: 'Title',
            sortable: true,
            property: 'title',
        },
        {
            label: 'Date',
            sortable: true,
            property: 'datetime',
            slotName: 'dateTime',
        },
        {
            label: 'Tags',
            sortable: false,
            property: 'tags',
            slotName: 'tags',
        },
    ];

    public loadNews () {
      return this.service.getCollectionByFilter(this.params)
    }

}
</script>
