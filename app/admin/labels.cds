using from '../../srv/books-service';

annotate categoryService.LibraryCategories with @odata.draft.enabled {
    name @Common.Label: '{i18n>CategoryName}';
    descr  @Common.Label: '{i18n>CategoryDescription}';
};
