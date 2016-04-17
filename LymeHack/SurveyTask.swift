//
//  SurveyTask.swift
//  LymeHack
//
//  Created by Zach Zeleznick on 4/16/16.
//  Copyright © 2016 zzeleznick. All rights reserved.
//

import ResearchKit

public var SurveyTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    // MARK - add instructions step
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "Patient Check-in"
    instructionStep.text = "Please fill out this survey so we can better track your treatment."
    steps += [instructionStep]
    
    // MARK - add name question
    /*
    let nameAnswerFormat = ORKTextAnswerFormat(maximumLength: 20)
    nameAnswerFormat.multipleLines = false
    let nameQuestionStepTitle = "What is your name, peasant?"
    let nameQuestionStep = ORKQuestionStep(identifier: "QuestionStep", title: nameQuestionStepTitle, answer: nameAnswerFormat)
    steps += [nameQuestionStep]
    */
    let feelStepTitle = "How are you feeling?"
    let feelChoices = [
        ORKTextChoice(text: "Much worse", value: 0),
        ORKTextChoice(text: "A little worse", value: 1),
        ORKTextChoice(text: "Same", value: 2),
        ORKTextChoice(text: "A little better", value: 3),
        ORKTextChoice(text: "Much better", value: 4)
    ]
    let feelsAnswerFormat = ORKTextScaleAnswerFormat(textChoices: feelChoices, defaultIndex: 0, vertical: false)
    
    let feelStep = ORKQuestionStep(identifier: "FeelStep", title: feelStepTitle, answer: feelsAnswerFormat)
     steps += [feelStep]
    
    // MARK - add 'what is your quest' question
    let questQuestionStepTitle = "How often have you excerised this week?"
    let textChoices = [
        ORKTextChoice(text: "Less than 1 hour", value: 0),
        ORKTextChoice(text: "1-3 hours", value: 1),
        ORKTextChoice(text: "3-10 hours", value: 2),
        ORKTextChoice(text: "10+ hours", value: 3)
    ]
    let questAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormatWithStyle(.SingleChoice, textChoices: textChoices)
    let questQuestionStep = ORKQuestionStep(identifier: "TextChoiceQuestionStep", title: questQuestionStepTitle, answer: questAnswerFormat)
    steps += [questQuestionStep]
    
    // MARK - add color question step
    // skip
    
    // MARK - add summary step
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "Survey Completed"
    summaryStep.text = "That was easy!"
    steps += [summaryStep]
    
    return ORKOrderedTask(identifier: "SurveyTask", steps: steps)
}
