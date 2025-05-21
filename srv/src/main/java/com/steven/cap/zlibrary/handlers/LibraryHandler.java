package com.steven.cap.zlibrary.handlers;

import java.util.HashMap;
import java.util.Locale.Category;
import java.util.Map;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.sap.cds.Result;
import com.sap.cds.ql.Insert;
import com.sap.cds.ql.cqn.AnalysisResult;
import com.sap.cds.ql.cqn.CqnAnalyzer;
import com.sap.cds.ql.cqn.CqnInsert;
import com.sap.cds.ql.cqn.CqnSelect;
import com.sap.cds.reflect.CdsModel;
import com.sap.cds.services.cds.ApplicationService;
import com.sap.cds.services.cds.CqnService;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.persistence.PersistenceService;

import cds.gen.my.library.*;
import cds.gen.categoryservice.*;


@Component
@ServiceName(CategoryService_.CDS_NAME)
public class LibraryHandler implements EventHandler {
    
    private final CqnAnalyzer analyzer;
    private final PersistenceService db;

    @Qualifier("CategoryService")
    private ApplicationService CategoryService;

    // @Autowired
    // private AdminService adminService;

    LibraryHandler(PersistenceService db, CdsModel model) {
        this.db = db;
        this.analyzer = CqnAnalyzer.create(model);
    }

    @On(event = LibraryCategoriesAddCategoryContext.CDS_NAME)
    public void onAddCategory(LibraryCategoriesAddCategoryContext context) {
        System.out.println("Adding new category...");

        // Create the new category
        LibraryCategories newCategory = LibraryCategories.create();
        newCategory.setName(context.getCategoryName());
        newCategory.setDescr(context.getCategoryDescription());

        // Send the new category to the database
        CqnInsert insert = Insert.into(LibraryCategories_.CDS_NAME).entry(newCategory);
        Result result = db.run(insert);
        LibraryCategories insertCategory = result.single(LibraryCategories.class);

        context.setResult(insertCategory);
    }

    @On(event = { CqnService.EVENT_CREATE, CqnService.EVENT_UPDATE }, entity = LibraryCategories_.CDS_NAME)
    public void onCreateOrUpdateCategory(LibraryCategories category) {
        System.out.println("Creating or updating category...");
        /*
        // Create the new category
        LibraryCategories newCategory = LibraryCategories.create();
        newCategory.setName(context.getCategoryName());
        newCategory.setDescr(context.getCategoryDescription());

        // Send the new category to the database
        CqnInsert insert = Insert.into(LibraryCategories_.CDS_NAME).entry(category);
        Result result = db.run(insert);
        LibraryCategories insertCategory = result.single(LibraryCategories.class);

        // Send the new category to the database
        context.setResult(insertCategory);
    */
    }

}
