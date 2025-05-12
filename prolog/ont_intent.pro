:- use_module(library(rdf)).
:- use_module(library(semweb/rdf11)). 
:- use_module(library(semweb/rdf_prefixes), [ (rdf_meta)/1, op(_,_,rdf_meta) ]). 
:- use_module(library(semweb/rdfs)) . 
:- use_module(library(semweb/turtle)) . 
:- use_module(library(semweb/rdf_portray)) .
:- rdf_meta virtualDeviceSpecification(o).
:- dynamic virtualDeviceSpecification/1.
virtualDeviceSpecification(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#VirtualDeviceSpecification').
:- rdf_meta intent(o).
:- dynamic intent/1.
intent(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#Intent').
:- rdf_meta variable(o).
:- dynamic variable/1.
variable(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#Variable').
:- rdf_meta variableSpecification(o).
:- dynamic variableSpecification/1.
variableSpecification(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#VariableSpecification').
:- rdf_meta blankType(o).
:- dynamic blankType/1.
blankType(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#BlankType').
:- rdf_meta containerSpecification(o).
:- dynamic containerSpecification/1.
containerSpecification(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#ContainerSpecification').
:- rdf_meta deviceSpecification(o).
:- dynamic deviceSpecification/1.
deviceSpecification(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#DeviceSpecification').
:- rdf_meta functionChainSpecification(o).
:- dynamic functionChainSpecification/1.
functionChainSpecification(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#FunctionChainSpecification').
:- rdf_meta serviceSpecification(o).
:- dynamic serviceSpecification/1.
serviceSpecification(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#ServiceSpecification').
:- rdf_meta deploymentUnitSpecification(o).
:- dynamic deploymentUnitSpecification/1.
deploymentUnitSpecification(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#DeploymentUnitSpecification').
:- rdf_meta hostSpecification(o).
:- dynamic hostSpecification/1.
hostSpecification(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#HostSpecification').
:- rdf_meta replicator(o).
:- dynamic replicator/1.
replicator(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#Replicator').
:- rdf_meta virtualMachineSpecification(o).
:- dynamic virtualMachineSpecification/1.
virtualMachineSpecification(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#VirtualMachineSpecification').
:- rdf_meta specification(o).
:- dynamic specification/1.
specification(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#Specification').
:- rdf_meta functionSpecification(o).
:- dynamic functionSpecification/1.
functionSpecification(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#FunctionSpecification').
:- rdf_meta definesHost(o, o).
:- dynamic definesHost/2.
definesHost(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definesHost', Y).
:- rdf_meta requiresFunction(o, o).
:- dynamic requiresFunction/2.
requiresFunction(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiresFunction', Y).
:- rdf_meta definesUnique(o, o).
:- dynamic definesUnique/2.
definesUnique(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definesUnique', Y).
:- rdf_meta requiresFunctionChain(o, o).
:- dynamic requiresFunctionChain/2.
requiresFunctionChain(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiresFunctionChain', Y).
:- rdf_meta maxReplication(o, o).
:- dynamic maxReplication/2.
maxReplication(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#maxReplication', Y).
:- rdf_meta requiresHost(o, o).
:- dynamic requiresHost/2.
requiresHost(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiresHost', Y).
:- rdf_meta definesDeploymentUnit(o, o).
:- dynamic definesDeploymentUnit/2.
definesDeploymentUnit(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definesDeploymentUnit', Y).
:- rdf_meta requiredBy(o, o).
:- dynamic requiredBy/2.
requiredBy(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiredBy', Y).
requiredBy(X, Y) :- requires(Y, X).
:- rdf_meta definesService(o, o).
:- dynamic definesService/2.
definesService(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definesService', Y).
:- rdf_meta replicates(o, o).
:- dynamic replicates/2.
replicates(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#replicates', Y).
:- rdf_meta requires(o, o).
:- dynamic requires/2.
requires(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requires', Y).
requires(X, Y) :- requiresFunction(X, Y).
requires(X, Y) :- requiresFunctionChain(X, Y).
requires(X, Y) :- maxReplication(X, Y).
requires(X, Y) :- requiresHost(X, Y).
requires(X, Y) :- defaultReplication(X, Y).
requires(X, Y) :- requiresVirtualDevice(X, Y).
requires(X, Y) :- requiresRole(X, Y).
requires(X, Y) :- requiresNetwork(X, Y).
requires(X, Y) :- minReplication(X, Y).
requires(X, Y) :- requiresDeploymentUnit(X, Y).
requires(X, Y) :- replication(X, Y).
:- rdf_meta executesIn(o, o).
:- dynamic executesIn/2.
executesIn(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#executesIn', Y).
:- rdf_meta defaultReplication(o, o).
:- dynamic defaultReplication/2.
defaultReplication(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#defaultReplication', Y).
:- rdf_meta requiresVirtualDevice(o, o).
:- dynamic requiresVirtualDevice/2.
requiresVirtualDevice(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiresVirtualDevice', Y).
:- rdf_meta requiresRole(o, o).
:- dynamic requiresRole/2.
requiresRole(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiresRole', Y).
:- rdf_meta executesOn(o, o).
:- dynamic executesOn/2.
executesOn(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#executesOn', Y).
:- rdf_meta connects(o, o).
:- dynamic connects/2.
connects(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#connects', Y).
connects(X, Y) :- connectsToDeploymentUnit(X, Y).
connects(X, Y) :- connectsToNetwork(X, Y).
:- rdf_meta connectsToDeploymentUnit(o, o).
:- dynamic connectsToDeploymentUnit/2.
connectsToDeploymentUnit(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#connectsToDeploymentUnit', Y).
:- rdf_meta intentProperty(o, o).
:- dynamic intentProperty/2.
intentProperty(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#intentProperty', Y).
intentProperty(X, Y) :- definesUnique(X, Y).
intentProperty(X, Y) :- requires(X, Y).
intentProperty(X, Y) :- executesIn(X, Y).
intentProperty(X, Y) :- executesOn(X, Y).
intentProperty(X, Y) :- connects(X, Y).
intentProperty(X, Y) :- defines(X, Y).
intentProperty(X, Y) :- definesShared(X, Y).
:- rdf_meta requiresNetwork(o, o).
:- dynamic requiresNetwork/2.
requiresNetwork(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiresNetwork', Y).
:- rdf_meta minReplication(o, o).
:- dynamic minReplication/2.
minReplication(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#minReplication', Y).
:- rdf_meta defines(o, o).
:- dynamic defines/2.
defines(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#defines', Y).
defines(X, Y) :- definesHost(X, Y).
defines(X, Y) :- definesDeploymentUnit(X, Y).
defines(X, Y) :- definesService(X, Y).
defines(X, Y) :- definesNetwork(X, Y).
defines(X, Y) :- definesFunction(X, Y).
:- rdf_meta definesNetwork(o, o).
:- dynamic definesNetwork/2.
definesNetwork(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definesNetwork', Y).
:- rdf_meta definesFunction(o, o).
:- dynamic definesFunction/2.
definesFunction(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definesFunction', Y).
:- rdf_meta connectsToNetwork(o, o).
:- dynamic connectsToNetwork/2.
connectsToNetwork(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#connectsToNetwork', Y).
:- rdf_meta requiresDeploymentUnit(o, o).
:- dynamic requiresDeploymentUnit/2.
requiresDeploymentUnit(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#requiresDeploymentUnit', Y).
:- rdf_meta definesShared(o, o).
:- dynamic definesShared/2.
definesShared(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#definesShared', Y).
:- rdf_meta replication(o, o).
:- dynamic replication/2.
replication(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/intent/intent#replication', Y).
