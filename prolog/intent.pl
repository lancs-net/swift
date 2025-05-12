:- table 'ComplianceDetail'/1.
:- table 'ComplianceQualifier'/1.
:- table 'Context'/1.
:- table 'DeliveryExpectation'/1.
:- table 'DeliveryParameter'/1.
:- table 'Element'/1.
:- table 'Expectation'/1.
:- table 'ExpectationReport'/1.
:- table 'Information'/1.
:- table 'InformationElement'/1.
:- table 'IntentInformation'/1.
:- table 'IntentManagementInformation'/1.
:- table 'Parameter'/1.
:- table 'ParameterCollection'/1.
:- table 'PropertyExpectation'/1.
:- table 'PropertyParameter'/1.
:- table 'ReportInformation'/1.
:- table 'ReportingExpectation'/1.
:- table 'ReportingParameter'/1.
:- table 'ReportingTimeContext'/1.
:- table 'RequirementDefiner'/1.
:- table 'RequirementElement'/1.
:- table 'RequirementExplainer'/1.
:- table 'RequirementReporter'/1.
:- table 'Target'/1.
:- table 'UnitContext'/1.
:- table virtualDeviceParameter/2.
:- table minInstanceNumber/2.
:- table flavorParameter/2.
:- table minCPURequirement/2.
:- table minMemoryRequirement/2.
:- table minStorageRequirement/2.
:- table networkModeRequirement/2.
:- table volumeRequirement/2.
:- table intentProperty/2.
:- table connects/2.
:- table connectsToDeploymentUnit/2.
:- table connectsToNetwork/2.
:- table definedBy/2.
:- table definedByDeploymentUnit/2.
:- table definedByNetwork/2.
:- table definedByFunction/2.
:- table definedByService/2.
:- table defines/2.
:- table definesDeploymentUnit/2.
:- table definesNetwork/2.
:- table definesFunction/2.
:- table definesService/2.
:- table executesIn/2.
:- table executesOn/2.
:- table requiredBy/2.
:- table requiredByDeploymentUnit/2.
:- table requiredByFunction/2.
:- table requires/2.
:- table requiresDeploymentUnit/2.
:- table requiresNetwork/2.
:- table requiresFunction/2.
:- table atLeast/2.
:- table atMost/2.
:- table event/2.
:- table exactly/2.
:- table greater/2.
:- table hasExpectation/2.
:- table hasParameter/2.
:- table hasTarget/2.
:- table hasTargetDescription/2.
:- table metric/2.
:- table receiver/2.
:- table smaller/2.
:- table targetDescription/2.
:- table targetResource/2.
:- table targetType/2.
:- table value/2.
:- table valueBy/2.
:- table label/2.
:- table comment/2.
:- table label/2.
:- table comment/2.
:- table isRuleEnabled/2.
:- discontiguous('Thing'/1).
:- discontiguous('ComplianceDetail'/1).
:- discontiguous('ComplianceQualifier'/1).
:- discontiguous('Context'/1).
:- discontiguous('DeliveryExpectation'/1).
:- discontiguous('DeliveryParameter'/1).
:- discontiguous('Element'/1).
:- discontiguous('Expectation'/1).
:- discontiguous('ExpectationReport'/1).
:- discontiguous('Information'/1).
:- discontiguous('InformationElement'/1).
:- discontiguous('IntentInformation'/1).
:- discontiguous('IntentManagementInformation'/1).
:- discontiguous('Parameter'/1).
:- discontiguous('ParameterCollection'/1).
:- discontiguous('PropertyExpectation'/1).
:- discontiguous('PropertyParameter'/1).
:- discontiguous('ReportInformation'/1).
:- discontiguous('ReportingExpectation'/1).
:- discontiguous('ReportingParameter'/1).
:- discontiguous('ReportingTimeContext'/1).
:- discontiguous('RequirementDefiner'/1).
:- discontiguous('RequirementElement'/1).
:- discontiguous('RequirementExplainer'/1).
:- discontiguous('RequirementReporter'/1).
:- discontiguous('Target'/1).
:- discontiguous('UnitContext'/1).
:- discontiguous(virtualDeviceParameter/2).
:- discontiguous(minInstanceNumber/2).
:- discontiguous(flavorParameter/2).
:- discontiguous(minCPURequirement/2).
:- discontiguous(minMemoryRequirement/2).
:- discontiguous(minStorageRequirement/2).
:- discontiguous(networkModeRequirement/2).
:- discontiguous(volumeRequirement/2).
:- discontiguous(intentProperty/2).
:- discontiguous(connects/2).
:- discontiguous(connectsToDeploymentUnit/2).
:- discontiguous(connectsToNetwork/2).
:- discontiguous(definedBy/2).
:- discontiguous(definedByDeploymentUnit/2).
:- discontiguous(definedByNetwork/2).
:- discontiguous(definedByFunction/2).
:- discontiguous(definedByService/2).
:- discontiguous(defines/2).
:- discontiguous(definesDeploymentUnit/2).
:- discontiguous(definesNetwork/2).
:- discontiguous(definesFunction/2).
:- discontiguous(definesService/2).
:- discontiguous(executesIn/2).
:- discontiguous(executesOn/2).
:- discontiguous(requiredBy/2).
:- discontiguous(requiredByDeploymentUnit/2).
:- discontiguous(requiredByFunction/2).
:- discontiguous(requires/2).
:- discontiguous(requiresDeploymentUnit/2).
:- discontiguous(requiresNetwork/2).
:- discontiguous(requiresFunction/2).
:- discontiguous(atLeast/2).
:- discontiguous(atMost/2).
:- discontiguous(event/2).
:- discontiguous(exactly/2).
:- discontiguous(greater/2).
:- discontiguous(hasExpectation/2).
:- discontiguous(hasParameter/2).
:- discontiguous(hasTarget/2).
:- discontiguous(hasTargetDescription/2).
:- discontiguous(metric/2).
:- discontiguous(receiver/2).
:- discontiguous(smaller/2).
:- discontiguous(targetDescription/2).
:- discontiguous(targetResource/2).
:- discontiguous(targetType/2).
:- discontiguous(value/2).
:- discontiguous(valueBy/2).
:- discontiguous(label/2).
:- discontiguous(comment/2).
:- discontiguous(label/2).
:- discontiguous(comment/2).
:- discontiguous(isRuleEnabled/2).
% annotationProperty('http://swrl.stanford.edu/ontologies/3.3/swrla.owl#isRuleEnabled') 
% annotationProperty('http://www.w3.org/2000/01/rdf-schema#comment') 
% annotationProperty('http://www.w3.org/2000/01/rdf-schema#label') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#ComplianceDetail') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#ComplianceQualifier') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Context') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#DeliveryExpectation') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#DeliveryParameter') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Element') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Expectation') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#ExpectationReport') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Information') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#InformationElement') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#IntentInformation') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#IntentManagementInformation') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Parameter') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#ParameterCollection') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#PropertyExpectation') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#PropertyParameter') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#ReportInformation') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#ReportingExpectation') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#ReportingParameter') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#ReportingTimeContext') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#RequirementDefiner') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#RequirementElement') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#RequirementExplainer') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#RequirementReporter') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Target') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#UnitContext') 
% dataProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#flavorParameter') 
% dataProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#minCPURequirement') 
% dataProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#minInstanceNumber') 
% dataProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#minMemoryRequirement') 
% dataProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#minStorageRequirement') 
% dataProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#networkModeRequirement') 
% dataProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#virtualDeviceParameter') 
% dataProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#volumeRequirement') 
% disjointClasses(['http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#DeliveryExpectation','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#PropertyExpectation']) 
'owl:Nothing'(X):-
     'DeliveryExpectation'(X),'PropertyExpectation'(X).
% disjointClasses(['http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#DeliveryExpectation','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#ReportingExpectation']) 
'owl:Nothing'(X):-
     'DeliveryExpectation'(X),'ReportingExpectation'(X).
% disjointClasses(['http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#DeliveryParameter','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#PropertyParameter']) 
'owl:Nothing'(X):-
     'DeliveryParameter'(X),'PropertyParameter'(X).
% disjointClasses(['http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#DeliveryParameter','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#ReportingParameter']) 
'owl:Nothing'(X):-
     'DeliveryParameter'(X),'ReportingParameter'(X).
% disjointClasses(['http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#InformationElement','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#RequirementElement']) 
'owl:Nothing'(X):-
     'InformationElement'(X),'RequirementElement'(X).
% disjointClasses(['http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#IntentInformation','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#ReportInformation']) 
'owl:Nothing'(X):-
     'IntentInformation'(X),'ReportInformation'(X).
% disjointClasses(['http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#PropertyExpectation','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#ReportingExpectation']) 
'owl:Nothing'(X):-
     'PropertyExpectation'(X),'ReportingExpectation'(X).
% disjointClasses(['http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#PropertyParameter','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#ReportingParameter']) 
'owl:Nothing'(X):-
     'PropertyParameter'(X),'ReportingParameter'(X).
% disjointClasses(['http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#ReportingTimeContext','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#UnitContext']) 
'owl:Nothing'(X):-
     'ReportingTimeContext'(X),'UnitContext'(X).
% disjointClasses(['http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#RequirementDefiner','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#RequirementExplainer']) 
'owl:Nothing'(X):-
     'RequirementDefiner'(X),'RequirementExplainer'(X).
% disjointClasses(['http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#RequirementDefiner','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#RequirementReporter']) 
'owl:Nothing'(X):-
     'RequirementDefiner'(X),'RequirementReporter'(X).
% disjointClasses(['http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#RequirementDefiner','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Target']) 
'owl:Nothing'(X):-
     'RequirementDefiner'(X),'Target'(X).
% disjointClasses(['http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#RequirementExplainer','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#RequirementReporter']) 
'owl:Nothing'(X):-
     'RequirementExplainer'(X),'RequirementReporter'(X).
% disjointClasses(['http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#RequirementExplainer','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Target']) 
'owl:Nothing'(X):-
     'RequirementExplainer'(X),'Target'(X).
% disjointClasses(['http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#RequirementReporter','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Target']) 
'owl:Nothing'(X):-
     'RequirementReporter'(X),'Target'(X).
% disjointProperties(['http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#intentProperty','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#descriptionProperty']) 
'owl:Nothing'(x):-
     intentProperty(X,Y),nm_descriptionProperty(X,Y).
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#atLeast') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#atMost') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#event') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#exactly') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#greater') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#hasExpectation') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#hasParameter') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#hasTarget') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#hasTargetDescription') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#metric') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#receiver') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#smaller') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#targetDescription') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#targetResource') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#targetType') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#value') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#valueBy') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#connects') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#connectsToDeploymentUnit') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#connectsToNetwork') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definedBy') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definedByDeploymentUnit') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definedByFunction') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definedByNetwork') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definedByService') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#defines') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definesDeploymentUnit') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definesFunction') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definesNetwork') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definesService') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#executesIn') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#executesOn') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#intentProperty') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiredBy') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiredByDeploymentUnit') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiredByFunction') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requires') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiresDeploymentUnit') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiresFunction') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiresNetwork') 
% ontology('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm') 
% ontology('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#') 
% inverseProperties('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#connectsToDeploymentUnit','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#connectsToNetwork') 
connectsToDeploymentUnit(X,Y):-
     connectsToNetwork(Y,X).
connectsToNetwork(X,Y):-
     connectsToDeploymentUnit(Y,X).
% inverseProperties('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definedBy','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#defines') 
definedBy(X,Y):-
     defines(Y,X).
defines(X,Y):-
     definedBy(Y,X).
% inverseProperties('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definedByDeploymentUnit','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definesDeploymentUnit') 
definedByDeploymentUnit(X,Y):-
     definesDeploymentUnit(Y,X).
definesDeploymentUnit(X,Y):-
     definedByDeploymentUnit(Y,X).
% inverseProperties('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definedByFunction','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definesFunction') 
definedByFunction(X,Y):-
     definesFunction(Y,X).
definesFunction(X,Y):-
     definedByFunction(Y,X).
% inverseProperties('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definedByNetwork','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definesNetwork') 
definedByNetwork(X,Y):-
     definesNetwork(Y,X).
definesNetwork(X,Y):-
     definedByNetwork(Y,X).
% inverseProperties('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definedByService','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definesService') 
definedByService(X,Y):-
     definesService(Y,X).
definesService(X,Y):-
     definedByService(Y,X).
% inverseProperties('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiredBy','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requires') 
requiredBy(X,Y):-
     requires(Y,X).
requires(X,Y):-
     requiredBy(Y,X).
% inverseProperties('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiredByDeploymentUnit','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiresDeploymentUnit') 
requiredByDeploymentUnit(X,Y):-
     requiresDeploymentUnit(Y,X).
requiresDeploymentUnit(X,Y):-
     requiredByDeploymentUnit(Y,X).
% inverseProperties('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiredByFunction','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiresFunction') 
requiredByFunction(X,Y):-
     requiresFunction(Y,X).
requiresFunction(X,Y):-
     requiredByFunction(Y,X).
% propertyDomain('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#atLeast','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Expectation') 
'Expectation'(X):-
     atLeast(X,_).
% propertyDomain('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#atMost','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Expectation') 
'Expectation'(X):-
     atMost(X,_).
% propertyDomain('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#exactly','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Expectation') 
'Expectation'(X):-
     exactly(X,_).
% propertyDomain('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#greater','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Expectation') 
'Expectation'(X):-
     greater(X,_).
% propertyDomain('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#hasExpectation','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#RequirementDefiner') 
'RequirementDefiner'(X):-
     hasExpectation(X,_).
% propertyDomain('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#hasParameter','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Expectation') 
'Expectation'(X):-
     hasParameter(X,_).
% propertyDomain('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#hasTarget','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Expectation') 
'Expectation'(X):-
     hasTarget(X,_).
% propertyDomain('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#smaller','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Expectation') 
'Expectation'(X):-
     smaller(X,_).
% propertyDomain('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#targetResource','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Target') 
'Target'(X):-
     targetResource(X,_).
% propertyDomain('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definesNetwork','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#Intent') 
'Intent'(X):-
     definesNetwork(X,_).
% propertyDomain('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definesService','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#Intent') 
'Intent'(X):-
     definesService(X,_).
% propertyDomain('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#executesOn','http://www.w3.org/2002/07/owl#Class') 
'Class'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#executesOn'(X,_).
% propertyDomain('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#minCPURequirement','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualMachine') 
'VirtualMachine'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#minCPURequirement'(X,_).
% propertyDomain('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#minInstanceNumber','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualDevice') 
'VirtualDevice'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#minInstanceNumber'(X,_).
% propertyDomain('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#minMemoryRequirement','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualMachine') 
'VirtualMachine'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#minMemoryRequirement'(X,_).
% propertyDomain('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#minStorageRequirement','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualMachine') 
'VirtualMachine'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#minStorageRequirement'(X,_).
% propertyDomain('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiresDeploymentUnit','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Function') 
'Function'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiresDeploymentUnit'(X,_).
% propertyRange('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#atLeast','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Parameter') 
'Parameter'(X):-
     atLeast(_,X).
% propertyRange('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#atMost','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Parameter') 
'Parameter'(X):-
     atMost(_,X).
% propertyRange('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#exactly','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Parameter') 
'Parameter'(X):-
     exactly(_,X).
% propertyRange('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#greater','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Parameter') 
'Parameter'(X):-
     greater(_,X).
% propertyRange('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#hasExpectation','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Expectation') 
'Expectation'(X):-
     hasExpectation(_,X).
% propertyRange('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#hasParameter','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Parameter') 
'Parameter'(X):-
     hasParameter(_,X).
% propertyRange('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#hasTarget','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Target') 
'Target'(X):-
     hasTarget(_,X).
% propertyRange('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#smaller','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Parameter') 
'Parameter'(X):-
     smaller(_,X).
% propertyRange('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#targetResource','http://www.w3.org/2000/01/rdf-schema#Resource') 
'Resource'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#targetResource'(_,X).
% propertyRange('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#connectsToNetwork','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Network') 
'Network'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#connectsToNetwork'(_,X).
% propertyRange('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definesDeploymentUnit','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#DeploymentUnit') 
'DeploymentUnit'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definesDeploymentUnit'(_,X).
% propertyRange('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definesFunction','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Function') 
'Function'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definesFunction'(_,X).
% propertyRange('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definesNetwork','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Network') 
'Network'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definesNetwork'(_,X).
% propertyRange('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definesService','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Service') 
'Service'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definesService'(_,X).
% propertyRange('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#executesIn','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ExecutionEnvironment') 
'ExecutionEnvironment'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#executesIn'(_,X).
% propertyRange('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#minCPURequirement','http://www.w3.org/2001/XMLSchema#unsignedInt') 
unsignedInt(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#minCPURequirement'(_,X).
% propertyRange('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#minInstanceNumber','http://www.w3.org/2001/XMLSchema#unsignedInt') 
unsignedInt(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#minInstanceNumber'(_,X).
% propertyRange('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#minMemoryRequirement','http://www.w3.org/2001/XMLSchema#float') 
float(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#minMemoryRequirement'(_,X).
% propertyRange('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#minStorageRequirement','http://www.w3.org/2001/XMLSchema#unsignedInt') 
unsignedInt(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#minStorageRequirement'(_,X).
% propertyRange('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiresDeploymentUnit','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#DeploymentUnit') 
'DeploymentUnit'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiresDeploymentUnit'(_,X).
% propertyRange('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiresFunction','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Function') 
'Function'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiresFunction'(_,X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#ComplianceDetail','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#RequirementDefiner') 
'RequirementDefiner'(X):-
     'ComplianceDetail'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#ComplianceQualifier','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#RequirementDefiner') 
'RequirementDefiner'(X):-
     'ComplianceQualifier'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Context','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#RequirementExplainer') 
'RequirementExplainer'(X):-
     'Context'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#DeliveryExpectation','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Expectation') 
'Expectation'(X):-
     'DeliveryExpectation'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#DeliveryParameter','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Parameter') 
'Parameter'(X):-
     'DeliveryParameter'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Element','http://www.w3.org/2002/07/owl#Class') 
'Class'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Element'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Expectation','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#RequirementDefiner') 
'RequirementDefiner'(X):-
     'Expectation'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#ExpectationReport','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#RequirementReporter') 
'RequirementReporter'(X):-
     'ExpectationReport'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Information','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#InformationElement') 
'InformationElement'(X):-
     'Information'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#InformationElement','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Element') 
'Element'(X):-
     'InformationElement'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#IntentInformation','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#IntentManagementInformation') 
'IntentManagementInformation'(X):-
     'IntentInformation'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#IntentManagementInformation','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Information') 
'Information'(X):-
     'IntentManagementInformation'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Parameter','http://www.w3.org/2002/07/owl#Class') 
'Class'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Parameter'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#ParameterCollection','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#RequirementDefiner') 
'RequirementDefiner'(X):-
     'ParameterCollection'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#PropertyExpectation','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Expectation') 
'Expectation'(X):-
     'PropertyExpectation'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#PropertyParameter','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Parameter') 
'Parameter'(X):-
     'PropertyParameter'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#ReportInformation','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#IntentManagementInformation') 
'IntentManagementInformation'(X):-
     'ReportInformation'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#ReportingExpectation','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Expectation') 
'Expectation'(X):-
     'ReportingExpectation'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#ReportingParameter','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Parameter') 
'Parameter'(X):-
     'ReportingParameter'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#ReportingTimeContext','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Context') 
'Context'(X):-
     'ReportingTimeContext'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#RequirementDefiner','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#RequirementElement') 
'RequirementElement'(X):-
     'RequirementDefiner'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#RequirementElement','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Element') 
'Element'(X):-
     'RequirementElement'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#RequirementExplainer','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#RequirementElement') 
'RequirementElement'(X):-
     'RequirementExplainer'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#RequirementReporter','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#RequirementElement') 
'RequirementElement'(X):-
     'RequirementReporter'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Target','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#RequirementElement') 
'RequirementElement'(X):-
     'Target'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#UnitContext','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#Context') 
'Context'(X):-
     'UnitContext'(X).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#atLeast','http://www.w3.org/2002/07/owl#topObjectProperty') 
topObjectProperty(X,Y):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#atLeast'(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#atMost','http://www.w3.org/2002/07/owl#topObjectProperty') 
topObjectProperty(X,Y):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#atMost'(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#event','http://www.w3.org/2002/07/owl#topObjectProperty') 
topObjectProperty(X,Y):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#event'(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#exactly','http://www.w3.org/2002/07/owl#topObjectProperty') 
topObjectProperty(X,Y):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#exactly'(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#greater','http://www.w3.org/2002/07/owl#topObjectProperty') 
topObjectProperty(X,Y):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#greater'(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#hasExpectation','http://www.w3.org/2002/07/owl#topObjectProperty') 
topObjectProperty(X,Y):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#hasExpectation'(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#hasParameter','http://www.w3.org/2002/07/owl#topObjectProperty') 
topObjectProperty(X,Y):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#hasParameter'(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#hasTargetDescription','http://www.w3.org/2002/07/owl#topObjectProperty') 
topObjectProperty(X,Y):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#hasTargetDescription'(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#metric','http://www.w3.org/2002/07/owl#topObjectProperty') 
topObjectProperty(X,Y):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#metric'(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#receiver','http://www.w3.org/2002/07/owl#topObjectProperty') 
topObjectProperty(X,Y):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#receiver'(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#smaller','http://www.w3.org/2002/07/owl#topObjectProperty') 
topObjectProperty(X,Y):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#smaller'(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#targetDescription','http://www.w3.org/2002/07/owl#topObjectProperty') 
topObjectProperty(X,Y):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#targetDescription'(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#targetType','http://www.w3.org/2002/07/owl#topObjectProperty') 
topObjectProperty(X,Y):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#targetType'(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#value','http://www.w3.org/2002/07/owl#topObjectProperty') 
topObjectProperty(X,Y):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#value'(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#valueBy','http://www.w3.org/2002/07/owl#topObjectProperty') 
topObjectProperty(X,Y):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/icm#valueBy'(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#connects','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#intentProperty') 
intentProperty(X,Y):-
     connects(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#connectsToDeploymentUnit','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#connects') 
connects(X,Y):-
     connectsToDeploymentUnit(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#connectsToNetwork','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#connects') 
connects(X,Y):-
     connectsToNetwork(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definedBy','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#intentProperty') 
intentProperty(X,Y):-
     definedBy(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definedByDeploymentUnit','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definedBy') 
definedBy(X,Y):-
     definedByDeploymentUnit(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definedByFunction','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definedBy') 
definedBy(X,Y):-
     definedByFunction(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definedByNetwork','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definedBy') 
definedBy(X,Y):-
     definedByNetwork(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definedByService','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definedBy') 
definedBy(X,Y):-
     definedByService(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#defines','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#intentProperty') 
intentProperty(X,Y):-
     defines(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definesDeploymentUnit','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#defines') 
defines(X,Y):-
     definesDeploymentUnit(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definesFunction','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#defines') 
defines(X,Y):-
     definesFunction(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definesNetwork','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#defines') 
defines(X,Y):-
     definesNetwork(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definesService','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#defines') 
defines(X,Y):-
     definesService(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#executesIn','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#intentProperty') 
intentProperty(X,Y):-
     executesIn(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#executesOn','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#intentProperty') 
intentProperty(X,Y):-
     executesOn(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#flavorParameter','http://www.w3.org/2002/07/owl#topDataProperty') 
topDataProperty(X,Y):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#flavorParameter'(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#intentProperty','http://www.w3.org/2002/07/owl#topObjectProperty') 
topObjectProperty(X,Y):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#intentProperty'(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#minCPURequirement','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#flavorParameter') 
flavorParameter(X,Y):-
     minCPURequirement(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#minInstanceNumber','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#virtualDeviceParameter') 
virtualDeviceParameter(X,Y):-
     minInstanceNumber(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#minMemoryRequirement','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#flavorParameter') 
flavorParameter(X,Y):-
     minMemoryRequirement(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#minStorageRequirement','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#flavorParameter') 
flavorParameter(X,Y):-
     minStorageRequirement(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#networkModeRequirement','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#containerParameter') 
containerParameter(X,Y):-
     networkModeRequirement(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiredBy','http://www.w3.org/2002/07/owl#topObjectProperty') 
topObjectProperty(X,Y):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiredBy'(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiredByDeploymentUnit','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiredBy') 
requiredBy(X,Y):-
     requiredByDeploymentUnit(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiredByFunction','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiredBy') 
requiredBy(X,Y):-
     requiredByFunction(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requires','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#intentProperty') 
intentProperty(X,Y):-
     requires(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requires','http://www.w3.org/2002/07/owl#topObjectProperty') 
topObjectProperty(X,Y):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requires'(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiresDeploymentUnit','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requires') 
requires(X,Y):-
     requiresDeploymentUnit(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiresFunction','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requires') 
requires(X,Y):-
     requiresFunction(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiresNetwork','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requires') 
requires(X,Y):-
     requiresNetwork(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#virtualDeviceParameter','http://www.w3.org/2002/07/owl#topDataProperty') 
topDataProperty(X,Y):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#virtualDeviceParameter'(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#volumeRequirement','http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#containerParameter') 
containerParameter(X,Y):-
     volumeRequirement(X,Y).
