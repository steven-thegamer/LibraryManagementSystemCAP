using from '../../srv/books-service';

annotate libraryService.LibraryBooks with {
    title @Common.Label: '{i18n>BookTitle}';
    desc  @Common.Label: '{i18n>BookDesc}';
};
