namespace my.library;

using { managed } from '@sap/cds/common';
using { my.dictionary } from '.././dictionary/elements';
using { my.library.Books2Publishers } from './_index';

entity Publishers : managed {
  key name: dictionary.publisher_name;
  books : Association to many Books2Publishers on books.publisher = $self;
}