//
//  ConsentDocument.swift
//  LymeHack
//
//  Created by Zach Zeleznick on 4/16/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//

import ResearchKit

public var ConsentDocument: ORKConsentDocument {
    
    let consentDocument = ORKConsentDocument()
    consentDocument.title = "LymeHack Consent"
    
    // MARK - Prepare Consent Sections
    let consentSectionTypes: [ORKConsentSectionType] = [
        .Overview,
        .DataGathering,
        .Privacy,
        .DataUse,
        .TimeCommitment,
        .StudySurvey,
        .StudyTasks,
        .Withdrawing
    ]
    
    let contentInfoTuples = [
        ["If you wish to complete this study your health can be monitored by your doctor.", "In this study you will be asked a series of questions about your health"],
        ["Your data will be gathered securely and fairly", "All of your data can be accessed by you and sensitive information will be de-identified"],
        ["Your privacy is our concern", "All of your data can be accessed by you and sensitive information will be de-identified"],
        ["Data will be used for research purposes only",  "All of your data can be accessed by you and sensitive information will be de-identified"],
        ["Surveys will be short and simple", "Let your doctor know if you have any questons"],
        ["Surveys will be short and simple", "Let your doctor know if you have any questons"],
        ["Surveys will be short and simple", "Let your doctor know if you have any questons"],
        ["Surveys will be short and simple", "Let your doctor know if you have any questons"]
    ]
    
    // MARK - Provide the info 
    let consentSections: [ORKConsentSection] = consentSectionTypes.enumerate().map { idx, contentSectionType in
        let consentSection = ORKConsentSection(type: contentSectionType)
        consentSection.summary = contentInfoTuples[idx][0]// "If you wish to complete this study your health can be monitored by your doctor."
        consentSection.content = contentInfoTuples[idx][1] // "In this study you will be asked a series of questions about your health"
        return consentSection
    }
    
    // MARK - Update the sections
    consentDocument.sections = consentSections
    
    
    // MARK - Ask for Signature
    consentDocument.addSignature(ORKConsentSignature(forPersonWithTitle: nil, dateFormatString: nil, identifier: "ConsentDocumentParticipantSignature"))
    return consentDocument
}
