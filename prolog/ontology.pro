:- use_module(library(rdf)).
:- use_module(library(semweb/rdf11)). 
:- use_module(library(semweb/rdf_prefixes), [ (rdf_meta)/1, op(_,_,rdf_meta) ]). 
:- use_module(library(semweb/rdfs)) . 
:- use_module(library(semweb/turtle)) . 
:- use_module(library(semweb/rdf_portray)) .
:- rdf_register_prefix(nm, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#').
:- table vxLan/1 as monotonic.
vxLan(Q):- rdfs_individual_of(Q, nm:'VxLAN').
:- table kvm/1 as monotonic.
kvm(Q):- rdfs_individual_of(Q, nm:'KVM').
:- table imap/1 as monotonic.
imap(Q):- rdfs_individual_of(Q, nm:'IMAP').
:- table ipSec/1 as monotonic.
ipSec(Q):- rdfs_individual_of(Q, nm:'IPSec').
:- table linuxBridge/1 as monotonic.
linuxBridge(Q):- rdfs_individual_of(Q, nm:'LinuxBridge').
:- table openVSwitch/1 as monotonic.
openVSwitch(Q):- rdfs_individual_of(Q, nm:'OpenVSwitch').
:- table snmp/1 as monotonic.
snmp(Q):- rdfs_individual_of(Q, nm:'SNMP').
:- table physicalNetwork/1 as monotonic.
physicalNetwork(Q):- rdfs_individual_of(Q, nm:'PhysicalNetwork').
:- table middleboxFunction/1 as monotonic.
middleboxFunction(Q):- rdfs_individual_of(Q, nm:'MiddleboxFunction').
:- table wirelessNetwork/1 as monotonic.
wirelessNetwork(Q):- rdfs_individual_of(Q, nm:'WirelessNetwork').
:- table lxd/1 as monotonic.
lxd(Q):- rdfs_individual_of(Q, nm:'LXD').
:- table bgp/1 as monotonic.
bgp(Q):- rdfs_individual_of(Q, nm:'BGP').
:- table vnflcm/1 as monotonic.
vnflcm(Q):- rdfs_individual_of(Q, nm:'VNFLCM').
:- table volumeType/1 as monotonic.
volumeType(Q):- rdfs_individual_of(Q, nm:'VolumeType').
:- table server/1 as monotonic.
server(Q):- rdfs_individual_of(Q, nm:'Server').
:- table ppp/1 as monotonic.
ppp(Q):- rdfs_individual_of(Q, nm:'PPP').
:- table location/1 as monotonic.
location(Q):- rdfs_individual_of(Q, nm:'Location').
:- table os/1 as monotonic.
os(Q):- rdfs_individual_of(Q, nm:'OS').
:- table floatingIp/1 as monotonic.
floatingIp(Q):- rdfs_individual_of(Q, nm:'FloatingIP').
:- table vdu/1 as monotonic.
vdu(Q):- rdfs_individual_of(Q, nm:'VDU').
:- table computeUsage/1 as monotonic.
computeUsage(Q):- rdfs_individual_of(Q, nm:'ComputeUsage').
:- table ipvtap/1 as monotonic.
ipvtap(Q):- rdfs_individual_of(Q, nm:'IPVTAP').
:- table rtsp/1 as monotonic.
rtsp(Q):- rdfs_individual_of(Q, nm:'RTSP').
:- table xen/1 as monotonic.
xen(Q):- rdfs_individual_of(Q, nm:'Xen').
:- table physicalMachine/1 as monotonic.
physicalMachine(Q):- rdfs_individual_of(Q, nm:'PhysicalMachine').
:- table virtualDevice/1 as monotonic.
virtualDevice(Q):- rdfs_individual_of(Q, nm:'VirtualDevice').
:- table dns/1 as monotonic.
dns(Q):- rdfs_individual_of(Q, nm:'DNS').
:- table securityGroupRule/1 as monotonic.
securityGroupRule(Q):- rdfs_individual_of(Q, nm:'SecurityGroupRule').
:- table vnfd/1 as monotonic.
vnfd(Q):- rdfs_individual_of(Q, nm:'VNFD').
:- table neutron/1 as monotonic.
neutron(Q):- rdfs_individual_of(Q, nm:'Neutron').
:- table ipvlan/1 as monotonic.
ipvlan(Q):- rdfs_individual_of(Q, nm:'IPVLAN').
:- table flavorAccess/1 as monotonic.
flavorAccess(Q):- rdfs_individual_of(Q, nm:'FlavorAccess').
:- table nsd/1 as monotonic.
nsd(Q):- rdfs_individual_of(Q, nm:'NSD').
:- table macvlan/1 as monotonic.
macvlan(Q):- rdfs_individual_of(Q, nm:'MACVLAN').
:- table overlayNetwork/1 as monotonic.
overlayNetwork(Q):- rdfs_individual_of(Q, nm:'OverlayNetwork').
:- table https/1 as monotonic.
https(Q):- rdfs_individual_of(Q, nm:'HTTPS').
:- table vnf/1 as monotonic.
vnf(Q):- rdfs_individual_of(Q, nm:'VNF').
:- table executionState/1 as monotonic.
executionState(Q):- rdfs_individual_of(Q, nm:executionState).
:- table nova/1 as monotonic.
nova(Q):- rdfs_individual_of(Q, nm:'Nova').
:- table loadBalanceFunction/1 as monotonic.
loadBalanceFunction(Q):- rdfs_individual_of(Q, nm:'LoadBalanceFunction').
:- table ospf/1 as monotonic.
ospf(Q):- rdfs_individual_of(Q, nm:'OSPF').
:- table icmPv6/1 as monotonic.
icmPv6(Q):- rdfs_individual_of(Q, nm:'ICMPv6').
:- table vdur/1 as monotonic.
vdur(Q):- rdfs_individual_of(Q, nm:'VDUR').
:- table terms/1 as monotonic.
terms(Q):- rdfs_individual_of(Q, nm:'Terms').
:- table ntp/1 as monotonic.
ntp(Q):- rdfs_individual_of(Q, nm:'NTP').
:- table transmission/1 as monotonic.
transmission(Q):- rdfs_individual_of(Q, nm:'Transmission').
:- table veth/1 as monotonic.
veth(Q):- rdfs_individual_of(Q, nm:'VETH').
:- table dhcp/1 as monotonic.
dhcp(Q):- rdfs_individual_of(Q, nm:'DHCP').
:- table physicalRouter/1 as monotonic.
physicalRouter(Q):- rdfs_individual_of(Q, nm:'PhysicalRouter').
:- table hypervisor/1 as monotonic.
hypervisor(Q):- rdfs_individual_of(Q, nm:'Hypervisor').
:- table virtualNetworkInterface/1 as monotonic.
virtualNetworkInterface(Q):- rdfs_individual_of(Q, nm:'VirtualNetworkInterface').
:- table clusterTemplate/1 as monotonic.
clusterTemplate(Q):- rdfs_individual_of(Q, nm:'ClusterTemplate').
:- table application/1 as monotonic.
application(Q):- rdfs_individual_of(Q, nm:'Application').
:- table coreRouter/1 as monotonic.
coreRouter(Q):- rdfs_individual_of(Q, nm:'CoreRouter').
:- table switchFunction/1 as monotonic.
switchFunction(Q):- rdfs_individual_of(Q, nm:'SwitchFunction').
:- table interface/1 as monotonic.
interface(Q):- rdfs_individual_of(Q, nm:'Interface').
:- table stack/1 as monotonic.
stack(Q):- rdfs_individual_of(Q, nm:'Stack').
:- table physicalDevice/1 as monotonic.
physicalDevice(Q):- rdfs_individual_of(Q, nm:'PhysicalDevice').
:- table package/1 as monotonic.
package(Q):- rdfs_individual_of(Q, nm:'Package').
:- table virtualMachine/1 as monotonic.
virtualMachine(Q):- rdfs_individual_of(Q, nm:'VirtualMachine').
:- table ftp/1 as monotonic.
ftp(Q):- rdfs_individual_of(Q, nm:'FTP').
:- table magnumService/1 as monotonic.
magnumService(Q):- rdfs_individual_of(Q, nm:'MagnumService').
:- table volumeTypeAccess/1 as monotonic.
volumeTypeAccess(Q):- rdfs_individual_of(Q, nm:'VolumeTypeAccess').
:- table ipoib/1 as monotonic.
ipoib(Q):- rdfs_individual_of(Q, nm:'IPOIB').
:- table hubFunction/1 as monotonic.
hubFunction(Q):- rdfs_individual_of(Q, nm:'HubFunction').
:- table wiredNetworkInterface/1 as monotonic.
wiredNetworkInterface(Q):- rdfs_individual_of(Q, nm:'WiredNetworkInterface').
:- table ip/1 as monotonic.
ip(Q):- rdfs_individual_of(Q, nm:'IP').
:- table functionChain/1 as monotonic.
functionChain(Q):- rdfs_individual_of(Q, nm:'FunctionChain').
:- table openstackTerm/1 as monotonic.
openstackTerm(Q):- rdfs_individual_of(Q, nm:'OpenstackTerm').
:- table host/1 as monotonic.
host(Q):- rdfs_individual_of(Q, nm:'Host').
:- table backendFunction/1 as monotonic.
backendFunction(Q):- rdfs_individual_of(Q, nm:'BackendFunction').
:- table ptp/1 as monotonic.
ptp(Q):- rdfs_individual_of(Q, nm:'PTP').
:- table macvtap/1 as monotonic.
macvtap(Q):- rdfs_individual_of(Q, nm:'MACVTAP').
:- table openstack/1 as monotonic.
openstack(Q):- rdfs_individual_of(Q, nm:'Openstack').
:- table nst/1 as monotonic.
nst(Q):- rdfs_individual_of(Q, nm:'NST').
:- table wirelessNetworkInterface/1 as monotonic.
wirelessNetworkInterface(Q):- rdfs_individual_of(Q, nm:'WirelessNetworkInterface').
:- table flavor/1 as monotonic.
flavor(Q):- rdfs_individual_of(Q, nm:'Flavor').
:- table http/1 as monotonic.
http(Q):- rdfs_individual_of(Q, nm:'HTTP').
:- table protocol/1 as monotonic.
protocol(Q):- rdfs_individual_of(Q, nm:'Protocol').
:- table nslcm/1 as monotonic.
nslcm(Q):- rdfs_individual_of(Q, nm:'NSLCM').
:- table osmTerm/1 as monotonic.
osmTerm(Q):- rdfs_individual_of(Q, nm:'OsmTerm').
:- table bgpFunction/1 as monotonic.
bgpFunction(Q):- rdfs_individual_of(Q, nm:'BGPFunction').
:- table databaseFunction/1 as monotonic.
databaseFunction(Q):- rdfs_individual_of(Q, nm:'DatabaseFunction').
:- table namespace/1 as monotonic.
namespace(Q):- rdfs_individual_of(Q, nm:'Namespace').
:- table network/1 as monotonic.
network(Q):- rdfs_individual_of(Q, nm:'Network').
:- table onap/1 as monotonic.
onap(Q):- rdfs_individual_of(Q, nm:'ONAP').
:- table kubernetes/1 as monotonic.
kubernetes(Q):- rdfs_individual_of(Q, nm:'Kubernetes').
:- table component/1 as monotonic.
component(Q):- rdfs_individual_of(Q, nm:'Component').
:- table osm/1 as monotonic.
osm(Q):- rdfs_individual_of(Q, nm:'OSM').
:- table udp/1 as monotonic.
udp(Q):- rdfs_individual_of(Q, nm:'UDP').
:- table volume/1 as monotonic.
volume(Q):- rdfs_individual_of(Q, nm:'Volume').
:- table securityGroup/1 as monotonic.
securityGroup(Q):- rdfs_individual_of(Q, nm:'SecurityGroup').
:- table mplsFunction/1 as monotonic.
mplsFunction(Q):- rdfs_individual_of(Q, nm:'MPLSFunction').
:- table image/1 as monotonic.
image(Q):- rdfs_individual_of(Q, nm:'Image').
:- table virtualEnvironment/1 as monotonic.
virtualEnvironment(Q):- rdfs_individual_of(Q, nm:'VirtualEnvironment').
:- table nlmon/1 as monotonic.
nlmon(Q):- rdfs_individual_of(Q, nm:'NLMON').
:- table wiredNetwork/1 as monotonic.
wiredNetwork(Q):- rdfs_individual_of(Q, nm:'WiredNetwork').
:- table unikernel/1 as monotonic.
unikernel(Q):- rdfs_individual_of(Q, nm:'Unikernel').
:- table routeFunction/1 as monotonic.
routeFunction(Q):- rdfs_individual_of(Q, nm:'RouteFunction').
:- table firewallFunction/1 as monotonic.
firewallFunction(Q):- rdfs_individual_of(Q, nm:'FirewallFunction').
:- table physicalSwitch/1 as monotonic.
physicalSwitch(Q):- rdfs_individual_of(Q, nm:'PhysicalSwitch').
:- table icmp/1 as monotonic.
icmp(Q):- rdfs_individual_of(Q, nm:'ICMP').
:- table service/1 as monotonic.
service(Q):- rdfs_individual_of(Q, nm:'Service').
:- table vnfr/1 as monotonic.
vnfr(Q):- rdfs_individual_of(Q, nm:'VNFR').
:- table mac/1 as monotonic.
mac(Q):- rdfs_individual_of(Q, nm:'MAC').
:- table internalNetwork/1 as monotonic.
internalNetwork(Q):- rdfs_individual_of(Q, nm:'InternalNetwork').
:- table executionEnvironment/1 as monotonic.
executionEnvironment(Q):- rdfs_individual_of(Q, nm:'ExecutionEnvironment').
:- table pop/1 as monotonic.
pop(Q):- rdfs_individual_of(Q, nm:'POP').
:- table ssh/1 as monotonic.
ssh(Q):- rdfs_individual_of(Q, nm:'SSH').
:- table vlan/1 as monotonic.
vlan(Q):- rdfs_individual_of(Q, nm:'VLAN').
:- table tcp/1 as monotonic.
tcp(Q):- rdfs_individual_of(Q, nm:'TCP').
:- table iPv6/1 as monotonic.
iPv6(Q):- rdfs_individual_of(Q, nm:'IPv6').
:- table orchestrator/1 as monotonic.
orchestrator(Q):- rdfs_individual_of(Q, nm:'Orchestrator').
:- table container/1 as monotonic.
container(Q):- rdfs_individual_of(Q, nm:'Container').
:- table physicalHub/1 as monotonic.
physicalHub(Q):- rdfs_individual_of(Q, nm:'PhysicalHub').
:- table electricity/1 as monotonic.
electricity(Q):- rdfs_individual_of(Q, nm:'Electricity').
:- table tls/1 as monotonic.
tls(Q):- rdfs_individual_of(Q, nm:'TLS').
:- table function/1 as monotonic.
function(Q):- rdfs_individual_of(Q, nm:'Function').
:- table igmp/1 as monotonic.
igmp(Q):- rdfs_individual_of(Q, nm:'IGMP').
:- table smtp/1 as monotonic.
smtp(Q):- rdfs_individual_of(Q, nm:'SMTP').
:- table nsilcm/1 as monotonic.
nsilcm(Q):- rdfs_individual_of(Q, nm:'NSILCM').
:- table device/1 as monotonic.
device(Q):- rdfs_individual_of(Q, nm:'Device').
:- table computeLimits/1 as monotonic.
computeLimits(Q):- rdfs_individual_of(Q, nm:'ComputeLimits').
:- table deploymentUnit/1 as monotonic.
deploymentUnit(Q):- rdfs_individual_of(Q, nm:'DeploymentUnit').
:- table virtualNetwork/1 as monotonic.
virtualNetwork(Q):- rdfs_individual_of(Q, nm:'VirtualNetwork').
:- table ldap/1 as monotonic.
ldap(Q):- rdfs_individual_of(Q, nm:'LDAP').
:- table pdu/1 as monotonic.
pdu(Q):- rdfs_individual_of(Q, nm:'PDU').
:- table keypair/1 as monotonic.
keypair(Q):- rdfs_individual_of(Q, nm:'Keypair').
:- table serverUsage/1 as monotonic.
serverUsage(Q):- rdfs_individual_of(Q, nm:'ServerUsage').
:- table iPv4/1 as monotonic.
iPv4(Q):- rdfs_individual_of(Q, nm:'IPv4').
:- table vcan/1 as monotonic.
vcan(Q):- rdfs_individual_of(Q, nm:'VCAN').
:- table ipNetwork/1 as monotonic.
ipNetwork(Q):- rdfs_individual_of(Q, nm:'IPNetwork').
:- table vxcan/1 as monotonic.
vxcan(Q):- rdfs_individual_of(Q, nm:'VXCAN').
:- table wire/1 as monotonic.
wire(Q):- rdfs_individual_of(Q, nm:'Wire').
:- table maCsec/1 as monotonic.
maCsec(Q):- rdfs_individual_of(Q, nm:'MACsec').
:- table oci/1 as monotonic.
oci(Q):- rdfs_individual_of(Q, nm:'OCI').
:- table irSenderReceiver/1 as monotonic.
irSenderReceiver(Q):- rdfs_individual_of(Q, nm:'IRSenderReceiver').
hasDeploymentUnit(X, Y):- rdf_has(X, nm:hasDeploymentUnit, Y).
isOf(X, Y):- rdf_has(X, nm:isOf, Y).
isOf(X, Y) :- isDeploymentUnitOf(X, Y).
isOf(X, Y) :- isInstanceOf(X, Y).
isOf(X, Y) :- isInterfaceOf(X, Y).
isOf(X, Y) :- isPackageOf(X, Y).
target(X, Y):- rdf_has(X, nm:target, Y).
supportsProtocol(X, Y):- rdf_has(X, nm:supportsProtocol, Y).
lacksExecutionMachine(X, Y):- rdf_has(X, nm:lacksExecutionMachine, Y).
deviceLocation(X, Y):- rdf_has(X, nm:deviceLocation, Y).
lacksPackage(X, Y):- rdf_has(X, nm:lacksPackage, Y).
hasPhysicalInterface(X, Y):- rdf_has(X, nm:hasPhysicalInterface, Y).
hasExecutionMachine(X, Y):- rdf_has(X, nm:hasExecutionMachine, Y).
hasNetworkFunction(X, Y):- rdf_has(X, nm:hasNetworkFunction, Y).
compute(X, Y):- rdf_has(X, nm:compute, Y).
hasInstance(X, Y):- rdf_has(X, nm:hasInstance, Y).
isDeploymentUnitOf(X, Y):- rdf_has(X, nm:isDeploymentUnitOf, Y).
isRunningOn(X, Y):- rdf_has(X, nm:isRunningOn, Y).
isDoing(X, Y):- rdf_has(X, nm:isDoing, Y).
isDoing(X, Y) :- isExecuting(X, Y).
isInstanceOf(X, Y):- rdf_has(X, nm:isInstanceOf, Y).
connected(X, Y):- rdf_has(X, nm:connected, Y).
connected(X, Y) :- connectedByWire(X, Y).
lacksInstance(X, Y):- rdf_has(X, nm:lacksInstance, Y).
network(X, Y):- rdf_has(X, nm:network, Y).
network(X, Y) :- interfaceProperty(X, Y).
role(X, Y):- rdf_has(X, nm:role, Y).
isInterfaceOf(X, Y):- rdf_has(X, nm:isInterfaceOf, Y).
isInterfaceOf(X, Y) :- isPhysicalInterfaceOf(X, Y).
isInterfaceOf(X, Y) :- isVirtualInterfaceOf(X, Y).
lacks(X, Y):- rdf_has(X, nm:lacks, Y).
lacks(X, Y) :- lacksExecutionMachine(X, Y).
lacks(X, Y) :- lacksPackage(X, Y).
lacks(X, Y) :- lacksInstance(X, Y).
isOn(X, Y):- rdf_has(X, nm:isOn, Y).
isOn(X, Y) :- isRunningOn(X, Y).
connectedByWire(X, Y):- rdf_has(X, nm:connectedByWire, Y).
existsOn(X, Y):- rdf_has(X, nm:existsOn, Y).
supports(X, Y):- rdf_has(X, nm:supports, Y).
supports(X, Y) :- supportsProtocol(X, Y).
hasVirtualInterface(X, Y):- rdf_has(X, nm:hasVirtualInterface, Y).
interfaceProperty(X, Y):- rdf_has(X, nm:interfaceProperty, Y).
isPhysicalInterfaceOf(X, Y):- rdf_has(X, nm:isPhysicalInterfaceOf, Y).
hasInterface(X, Y):- rdf_has(X, nm:hasInterface, Y).
hasInterface(X, Y) :- hasPhysicalInterface(X, Y).
hasInterface(X, Y) :- hasVirtualInterface(X, Y).
link(X, Y):- rdf_has(X, nm:link, Y).
isVirtualInterfaceOf(X, Y):- rdf_has(X, nm:isVirtualInterfaceOf, Y).
physicalLink(X, Y):- rdf_has(X, nm:physicalLink, Y).
hasPackage(X, Y):- rdf_has(X, nm:hasPackage, Y).
has(X, Y):- rdf_has(X, nm:has, Y).
has(X, Y) :- hasDeploymentUnit(X, Y).
has(X, Y) :- hasExecutionMachine(X, Y).
has(X, Y) :- hasNetworkFunction(X, Y).
has(X, Y) :- hasInstance(X, Y).
has(X, Y) :- hasInterface(X, Y).
has(X, Y) :- hasPackage(X, Y).
isPackageOf(X, Y):- rdf_has(X, nm:isPackageOf, Y).
report(X, Y):- rdf_has(X, nm:report, Y).
isExecuting(X, Y):- rdf_has(X, nm:isExecuting, Y).
descriptionProperty(X, Y):- rdf_has(X, nm:descriptionProperty, Y).
descriptionProperty(X, Y) :- isOf(X, Y).
descriptionProperty(X, Y) :- target(X, Y).
descriptionProperty(X, Y) :- isDoing(X, Y).
descriptionProperty(X, Y) :- connected(X, Y).
descriptionProperty(X, Y) :- lacks(X, Y).
descriptionProperty(X, Y) :- isOn(X, Y).
descriptionProperty(X, Y) :- existsOn(X, Y).
descriptionProperty(X, Y) :- supports(X, Y).
descriptionProperty(X, Y) :- has(X, Y).
descriptionProperty(X, Y) :- report(X, Y).
:- table vcpuResource/2 as monotonic.
vcpuResource(X, Y):- rdf_has(X, nm:vcpuResource, Y).
:- table webPath/2 as monotonic.
webPath(X, Y):- rdf_has(X, nm:webPath, Y).
:- table vcpuUtilization/2 as monotonic.
vcpuUtilization(X, Y):- rdf_has(X, nm:vcpuUtilization, Y).
:- table ipAddress/2 as monotonic.
ipAddress(X, Y):- rdf_has(X, nm:ipAddress, Y).
ipAddress(X, Y) :- ipv6Address(X, Y).
ipAddress(X, Y) :- ipv4Address(X, Y).
:- table storageResource/2 as monotonic.
storageResource(X, Y):- rdf_has(X, nm:storageResource, Y).
:- table resourceUtilization/2 as monotonic.
resourceUtilization(X, Y):- rdf_has(X, nm:resourceUtilization, Y).
resourceUtilization(X, Y) :- vcpuUtilization(X, Y).
resourceUtilization(X, Y) :- memoryUtilization(X, Y).
resourceUtilization(X, Y) :- cpuUtilization(X, Y).
resourceUtilization(X, Y) :- storageUtilization(X, Y).
:- table ipv6Address/2 as monotonic.
ipv6Address(X, Y):- rdf_has(X, nm:ipv6Address, Y).
:- table address/2 as monotonic.
address(X, Y):- rdf_has(X, nm:address, Y).
address(X, Y) :- ipAddress(X, Y).
address(X, Y) :- macAddress(X, Y).
:- table memoryUtilization/2 as monotonic.
memoryUtilization(X, Y):- rdf_has(X, nm:memoryUtilization, Y).
:- table macAddress/2 as monotonic.
macAddress(X, Y):- rdf_has(X, nm:macAddress, Y).
:- table cpuUtilization/2 as monotonic.
cpuUtilization(X, Y):- rdf_has(X, nm:cpuUtilization, Y).
:- table resourceDescription/2 as monotonic.
resourceDescription(X, Y):- rdf_has(X, nm:resourceDescription, Y).
resourceDescription(X, Y) :- vcpuResource(X, Y).
resourceDescription(X, Y) :- storageResource(X, Y).
resourceDescription(X, Y) :- memoryResource(X, Y).
:- table storageUtilization/2 as monotonic.
storageUtilization(X, Y):- rdf_has(X, nm:storageUtilization, Y).
:- table port/2 as monotonic.
port(X, Y):- rdf_has(X, nm:port, Y).
:- table memoryResource/2 as monotonic.
memoryResource(X, Y):- rdf_has(X, nm:memoryResource, Y).
:- table ipv4Address/2 as monotonic.
ipv4Address(X, Y):- rdf_has(X, nm:ipv4Address, Y).
:- table path/2 as monotonic.
path(X, Y):- rdf_has(X, nm:path, Y).
path(X, Y) :- storagePath(X, Y).
path(X, Y) :- directoryPath(X, Y).
:- table storagePath/2 as monotonic.
storagePath(X, Y):- rdf_has(X, nm:storagePath, Y).
:- table directoryPath/2 as monotonic.
directoryPath(X, Y):- rdf_has(X, nm:directoryPath, Y).
