using from '../../srv/books-service';

annotate categoryService.LibraryCategories with @(
    UI.HeaderInfo: {
        TypeName      : '{i18n>HeaderTitle}',
        TypeNamePlural: '{i18n>BookInfo}',
    },
    UI.SelectionFields     : [
        name,
    ],
    UI.LineItem  : [
        {
            Value             : name,
            @UI.Importance    : #High,
            @HTML5.CssDefaults: {width: '10em'}
        },
        {
            Value             : descr,
            @UI.Importance    : #High,
            @HTML5.CssDefaults: {width: '50em'}
        },
        /*
        {
            $Type         : 'UI.DataField',
            Value         : book_author,
            @UI.Importance: #Medium,
        },
        {
            $Type         : 'UI.DataField',
            Value         : book_publisher,
            @UI.Importance: #High,
        },
        {
            $Type         : 'UI.DataField',
            Value         : book_category,
            @UI.Importance: #High,
        },
        {
            $Type: 'UI.DataField',
            Value: stock,
        },
        {
            $Type: 'UI.DataField',
            Value: rating,
        },
        */
    ],

);
