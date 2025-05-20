namespace my.library;

using { cuid, managed, sap.common.CodeList } from '@sap/cds/common';
using { my.library.Books2Categories } from './_index';

@assert.unique: {
  name : [ name ]
}

entity Categories : cuid, managed, CodeList {
  parent : Association to one Categories on parent.name = $self.name;
  subCategories: Composition of many Categories on subCategories.name = $self.name;
  books : Association to many Books2Categories on books.category = $self;
}