namespace my.library;

using { managed } from '@sap/cds/common';
using { my.dictionary } from '.././dictionary/elements';
using { my.library.Books2Authors } from './_index';

@assert.unique: {
  name : [ name ]
}

entity Authors : managed {
  key name: dictionary.person_name;
  gender : dictionary.gender;
  books_written : Association to many Books2Authors on books_written.author = $self;
}

annotate Authors with {

};
