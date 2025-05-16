namespace my.library;

using { managed } from '@sap/cds/common';
using { my.dictionary } from '.././dictionary/elements';

entity Books : managed {
  key ID: dictionary.ID;
  title: dictionary.title;
  desc : dictionary.descr;
  author: Association to Authors on author.ID = $self.ID;
  publisher : Association to Publishers on publisher.ID = $self.ID;
  category : Association to Categories;
}

entity Authors : managed {
  key ID: dictionary.ID;
  name: dictionary.person_name;
  gender : dictionary.gender;
}

entity Categories : managed {
  key name: dictionary.category_name;
  parent : Association to Categories on parent.name = $self.name;
  subCategories: Composition of many Categories on subCategories.name = $self.name;
}

entity Publishers : managed {
  key ID: dictionary.ID;
  name: dictionary.publisher_name;
}