<template>
    <VTable
        :service="service"
        :params="filterParams"
        :columns="columns"
        :load-records-function="loadNews"
        header="News"
        search-placeholder="Search news"
        message-no-results="Could not find news matching your criteria."
    >
        <template v-slot:cell:image="{ record: news }">
            <img :src="news.imageThumbnail"
                 :title="news.title"
                 class="img-responsive"
            />
        </template>
        <template v-slot:cell:title="{ record: news }">
            <a :href="news.singleUri">{{ news.title }}</a>
        </template>
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
import { Inject, DependencyInjection } from 'Base/ObjectManager';
import BaseComponent from 'Base/Vue/Component/BaseComponent';
import VTable, { Column } from 'Base/Vue/Component/Table/VTable';
import NewsService from '../Service/NewsService';
import FilterParams from '../Model/News/FilterParams';

@DependencyInjection()
@Component({
    components: {
        VTable
    }
})
export default class List
    extends BaseComponent
{

    public static MOUNT_ON = '.js-news-list';

    @Inject()
    public service : NewsService = new NewsService();

    public filterParams : FilterParams = new FilterParams();

    public columns : Column[] = [
        {
            label: 'Teaser',
            sortable: false,
            property: 'image',
        },
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
        console.log(this.filterParams)
        return this.service.getCollectionByFilter(this.filterParams);
    }

}
</script>
