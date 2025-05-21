
package com.steven.cap.zlibrary.handlers;

import static cds.gen.categoryservice.CategoryService_.LIBRARY_CATEGORIES;

import cds.gen.my.library.*;
import cds.gen.categoryservice.*;
import com.steven.cap.zlibrary.handlers.Messages;

import java.util.function.Supplier;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sap.cds.ql.Select;
import com.sap.cds.ql.Update;
import com.sap.cds.ql.cqn.CqnAnalyzer;
import com.sap.cds.reflect.CdsModel;
import com.sap.cds.services.ErrorStatuses;
import com.sap.cds.services.ServiceException;
import com.sap.cds.services.draft.DraftCancelEventContext;
import com.sap.cds.services.draft.DraftCreateEventContext;
import com.sap.cds.services.draft.DraftEditEventContext;
import com.sap.cds.services.draft.DraftNewEventContext;
import com.sap.cds.services.draft.DraftPatchEventContext;
import com.sap.cds.services.draft.DraftPrepareEventContext;
import com.sap.cds.services.draft.DraftReadEventContext;
import com.sap.cds.services.draft.DraftSaveEventContext;
import com.sap.cds.services.draft.DraftService;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.Before;
import com.sap.cds.services.handler.annotations.ServiceName;

@Component
@ServiceName(CategoryService_.CDS_NAME)
public class CategoryDraftHandler implements EventHandler {

    @Autowired
    private CdsModel model;

    @Autowired
    private CategoryService.Draft categoryDraft;
/*
    @Before(event = DraftService.EVENT_DRAFT_NEW)
    public void prefillBookInfo(DraftNewEventContext context, LibraryCategories category) {
        System.out.println("prefillBookInfo" + category.toJson());
        category.setIsReviewable(false);
    }
*/
    @Before(event = DraftService.EVENT_DRAFT_CREATE)
    public void validateCategoryInfo(DraftCreateEventContext context, LibraryCategories category) {
        System.out.println("validateCategoryInfo" + category.toJson());
    }
/*
    @Before(event = DraftService.EVENT_DRAFT_PATCH)
    public void calculateData(DraftPatchEventContext context, LibraryCategories category) {
        System.out.println("calculateData" + category.toJson());
        if (category.getStock() != null) {
            Integer stock = category.getStock();
            if (stock == 0) {
                category.setPrice(BigDecimal.valueOf(0));
            }
            category.setStatusCode(stock == 0 ? "O" : "A");
        }
    }
*/
    @Before(event = DraftService.EVENT_DRAFT_SAVE)
    public void saveDraft(DraftSaveEventContext context) {
        LibraryCategories category = getCategoryDraft(getCategoryId(context), false);
        System.out.println("saveDraft" + category.toJson());
        updateCategoryDraft(category, false, LibraryCategories.DESCR, "saveDraft" + category.getDescr());
    }

    @Before(event = DraftService.EVENT_DRAFT_CANCEL)
    public void deleteDraft(DraftCancelEventContext context) {
        System.out.println("deleteDraft" + getCategoryDraft(getCategoryId(context), false).toJson());
    }

    @Before(event = DraftService.EVENT_DRAFT_EDIT)
    public void editDraft(DraftEditEventContext context) {
        LibraryCategories category = getCategoryDraft(getCategoryId(context), true);
        System.out.println("editDraft" + category.toJson());
        if (category.getDescr().contains("winter")) {
            throw new ServiceException(ErrorStatuses.FORBIDDEN, "You cannot edit win's category!");
        }
    }

    @Before(event = DraftService.EVENT_DRAFT_READ)
    public void readDraft(DraftReadEventContext context) {
        System.out.println("readDraft");
    }

    // @Before(event = DraftService.EVENT_DRAFT_PREPARE)
    public void prepareDraft(DraftPrepareEventContext context) {
        System.out.println("prepareDraft");
    }

    private String getCategoryId(DraftSaveEventContext context) {
        return (String) CqnAnalyzer.create(model).analyze(context.getCqn()).targetKeys().get(LibraryCategories.ID);
    }

    private String getCategoryId(DraftCancelEventContext context) {
        return (String) CqnAnalyzer.create(model).analyze(context.getCqn()).targetKeys().get(LibraryCategories.ID);
    }

    private String getCategoryId(DraftEditEventContext context) {
        return (String) CqnAnalyzer.create(model).analyze(context.getCqn()).targetKeys().get(LibraryCategories.ID);
    }

    private LibraryCategories getCategoryDraft(String categoryName, Boolean isActiveEntity) {
        return categoryDraft.run(Select.from(LIBRARY_CATEGORIES).where(o -> o.getName().eq(categoryName).and(o.IsActiveEntity().eq(isActiveEntity)))).first(LibraryCategories.class).orElseThrow(notFound(Messages.CATEGORY_MISSING));
    }

    private LibraryCategories updateCategoryDraft(LibraryCategories category, Boolean isActiveEntity, String column, Object value) {
        categoryDraft.patchDraft(Update.entity(LIBRARY_CATEGORIES).where(o -> o.getId().eq(category.getId()).and(o.IsActiveEntity().eq(isActiveEntity))).data(column, value));
        return category;
    }

    private Supplier<ServiceException> notFound(String message) {
        return () -> new ServiceException(ErrorStatuses.NOT_FOUND, message);
    }

    public CategoryDraftHandler() {
        // Default constructor
    }

    // Add your methods here

}