using { my.library } from '../db/index.cds';

service libraryService {
  entity LibraryBooks as projection on library.Books
  excluding { createdBy, modifiedBy, createdAt, modifiedAt };
  entity LibraryAuthors as projection on library.Authors
  excluding { createdBy, modifiedBy, createdAt, modifiedAt };
  entity LibraryPublishers as projection on library.Publishers
  excluding { createdBy, modifiedBy, createdAt, modifiedAt };
  entity LibraryCategories as projection on library.Categories
  excluding { createdBy, modifiedBy, createdAt, modifiedAt };
  action addCategory(category_name: String, category_description: String) returns LibraryCategories;
}