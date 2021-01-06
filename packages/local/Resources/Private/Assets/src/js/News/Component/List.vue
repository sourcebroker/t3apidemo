<template>
    <VTable
        :service="service"
        :params="params"
        :columns="columns"
        :load-records-function="loadNews"
        header="News"
        search-placeholder="Search news"
        message-no-results="Could not find news matching your criteria."
    >
        <template v-slot:cell:datetime="{ record: news }">
            {{ news.datetime | formatDate }}
        </template>
        <template v-slot:cell:tags="{ record: news }">
            {{ news.tags | implode(', ', 'title') }}
        </template>
    </VTable>
</template>
<script lang="ts">
import { Component } from 'vue-property-decorator';
import BaseComponent from 'Base/Vue/Component/BaseComponent';
import VTable, { Column } from 'Base/Vue/Component/Table/VTable';
import NewsService from '../Service/NewsService';
import News from '../Model/News';
import NewsFilter from '../Model/Filter/NewsFilter';

new News();

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

    public params : NewsFilter = new NewsFilter();

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
        },
        {
            label: 'Tags',
            sortable: false,
            property: 'tags',
        },
    ];

    public loadNews()
    {
        return this.service.getCollectionByFilter(this.params);
    }

}
</script>
