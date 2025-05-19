namespace my.library;

using { managed } from '@sap/cds/common';
using { my.dictionary } from '.././dictionary/elements';
using { my.library.Books2Categories } from './_index';

entity Categories : managed {
  key name: dictionary.category_name;
  parent : Association to Categories on parent.name = $self.name;
  subCategories: Composition of many Categories on subCategories.name = $self.name;
  books : Association to many Books2Categories on books.category = $self;
}