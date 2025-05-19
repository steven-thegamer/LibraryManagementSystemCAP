package com.steven.cap.zlibrary.handlers;

import java.util.Map;

import org.springframework.stereotype.Component;

import com.sap.cds.Result;
import com.sap.cds.ql.Insert;
import com.sap.cds.ql.cqn.AnalysisResult;
import com.sap.cds.ql.cqn.CqnAnalyzer;
import com.sap.cds.ql.cqn.CqnInsert;
import com.sap.cds.ql.cqn.CqnSelect;
import com.sap.cds.reflect.CdsModel;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.persistence.PersistenceService;

import cds.gen.my.library.*;
import cds.gen.libraryservice.*;


@Component
@ServiceName(LibraryService_.CDS_NAME)
public class LibraryHandler implements EventHandler {

    private final PersistenceService db;
    private final CqnAnalyzer analyzer;

    public LibraryHandler(PersistenceService db, CdsModel model) {
        this.db = db;
        this.analyzer = CqnAnalyzer.create(model);
    }

    @On(entity = Books_.CDS_NAME)
    public void onInsertBooks(Insert insert) {
        CqnInsert cqnInsert = (CqnInsert) insert;
        AnalysisResult analysisResult = analyzer.analyze(cqnInsert);
        Result result = db.run(cqnInsert);
        Map<String, Object> insertedData = result.first().asMap();
        System.out.println("Inserted Data: " + insertedData);
        System.out.println("Analysis Result: " + analysisResult);
    }

    @On(entity = Authors_.CDS_NAME)
    public void onSelectAuthors(CqnSelect select) {
        Result result = db.run(select);
        System.out.println("Selected Authors: " + result.list());
    }
    
}
