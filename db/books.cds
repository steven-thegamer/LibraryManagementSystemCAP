namespace my.library;

using { managed } from '@sap/cds/common';
using { my.library.Gender } from './users';

entity Books : managed {
  key ID: Integer;
  title: localized String(100);
  desc : localized String(500);
  author: Association to Authors on author.ID = $self.ID;
  publisher : Association to Publishers on publisher.ID = $self.ID;
  category : Association to Categories;
}

entity Authors : managed {
  key ID: Integer;
  name: String(100);
  gender : Gender;
}

entity Categories : managed {
  key name: String(100);
  parent : Association to Categories on parent.name = $self.name;
  subCategories: Composition of many Categories on subCategories.name = $self.name;
}

entity Publishers : managed {
  key ID: Integer;
  name: String(100);
}