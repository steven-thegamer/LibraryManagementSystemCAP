namespace my.library;

using { cuid, managed } from '@sap/cds/common';
using { my.dictionary } from '.././dictionary/elements';
using { my.library.Books2Publishers } from './_index';

entity Publishers : cuid, managed {
  name: dictionary.publisher_name;
  books : Association to many Books2Publishers on books.publisher = $self;
}