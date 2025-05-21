using { my.library } from '../db/index.cds';

service categoryService {
  entity LibraryCategories as projection on library.Categories
  excluding { createdBy, modifiedBy, createdAt, modifiedAt } actions {
  action addCategory(category_name: String, category_description: String) returns LibraryCategories;
  };
}