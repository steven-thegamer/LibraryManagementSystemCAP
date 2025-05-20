using from '../../srv/books-service';

annotate libraryService.LibraryBooks with @(
    UI.HeaderInfo: {
        TypeName      : '{i18n>HeaderTitle}',
        TypeNamePlural: '{i18n>BookInfo}',
    },
    UI.SelectionFields     : [
        title,
    ],
    UI.LineItem  : [
        {
            Value             : title,
            @UI.Importance    : #High,
            @HTML5.CssDefaults: {width: '10em'}
        },
        {
            Value             : desc,
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
