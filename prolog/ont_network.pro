:- use_module(library(rdf)).
:- use_module(library(semweb/rdf11)). 
:- use_module(library(semweb/rdf_prefixes), [ (rdf_meta)/1, op(_,_,rdf_meta) ]). 
:- use_module(library(semweb/rdfs)) . 
:- use_module(library(semweb/turtle)) . 
:- use_module(library(semweb/rdf_portray)) .
:- rdf_meta error1(o).
:- dynamic error1/1.
error1(Q) :- rdfs_individual_of(Q, 'http://org.semanticweb.owlapi/error#Error1').
:- rdf_meta vxLan(o).
:- dynamic vxLan/1.
vxLan(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VxLAN').
:- rdf_meta kvm(o).
:- dynamic kvm/1.
kvm(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#KVM').
:- rdf_meta imap(o).
:- dynamic imap/1.
imap(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IMAP').
:- rdf_meta ipSec(o).
:- dynamic ipSec/1.
ipSec(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IPSec').
:- rdf_meta linuxBridge(o).
:- dynamic linuxBridge/1.
linuxBridge(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#LinuxBridge').
:- rdf_meta openVSwitch(o).
:- dynamic openVSwitch/1.
openVSwitch(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OpenVSwitch').
:- rdf_meta userEquipment(o).
:- dynamic userEquipment/1.
userEquipment(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#UserEquipment').
:- rdf_meta snmp(o).
:- dynamic snmp/1.
snmp(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#SNMP').
:- rdf_meta applicationFunction(o).
:- dynamic applicationFunction/1.
applicationFunction(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ApplicationFunction').
:- rdf_meta physicalNetwork(o).
:- dynamic physicalNetwork/1.
physicalNetwork(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PhysicalNetwork').
:- rdf_meta middleboxFunction(o).
:- dynamic middleboxFunction/1.
middleboxFunction(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#MiddleboxFunction').
:- rdf_meta wirelessNetwork(o).
:- dynamic wirelessNetwork/1.
wirelessNetwork(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#WirelessNetwork').
:- rdf_meta lxd(o).
:- dynamic lxd/1.
lxd(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#LXD').
:- rdf_meta bgp(o).
:- dynamic bgp/1.
bgp(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#BGP').
:- rdf_meta vnflcm(o).
:- dynamic vnflcm/1.
vnflcm(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VNFLCM').
:- rdf_meta volumeType(o).
:- dynamic volumeType/1.
volumeType(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VolumeType').
:- rdf_meta server(o).
:- dynamic server/1.
server(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Server').
:- rdf_meta ppp(o).
:- dynamic ppp/1.
ppp(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PPP').
:- rdf_meta location(o).
:- dynamic location/1.
location(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Location').
:- rdf_meta os(o).
:- dynamic os/1.
os(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OS').
:- rdf_meta floatingIp(o).
:- dynamic floatingIp/1.
floatingIp(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#FloatingIP').
:- rdf_meta vdu(o).
:- dynamic vdu/1.
vdu(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VDU').
:- rdf_meta computeUsage(o).
:- dynamic computeUsage/1.
computeUsage(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ComputeUsage').
:- rdf_meta ipvtap(o).
:- dynamic ipvtap/1.
ipvtap(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IPVTAP').
:- rdf_meta rtsp(o).
:- dynamic rtsp/1.
rtsp(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#RTSP').
:- rdf_meta xen(o).
:- dynamic xen/1.
xen(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Xen').
:- rdf_meta radioConnection(o).
:- dynamic radioConnection/1.
radioConnection(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#RadioConnection').
:- rdf_meta physicalMachine(o).
:- dynamic physicalMachine/1.
physicalMachine(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PhysicalMachine').
:- rdf_meta virtualDevice(o).
:- dynamic virtualDevice/1.
virtualDevice(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualDevice').
:- rdf_meta dns(o).
:- dynamic dns/1.
dns(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#DNS').
:- rdf_meta bandwidthClaim(o).
:- dynamic bandwidthClaim/1.
bandwidthClaim(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#BandwidthClaim').
:- rdf_meta policyControlFunction(o).
:- dynamic policyControlFunction/1.
policyControlFunction(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PolicyControlFunction').
:- rdf_meta securityGroupRule(o).
:- dynamic securityGroupRule/1.
securityGroupRule(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#SecurityGroupRule').
:- rdf_meta vnfd(o).
:- dynamic vnfd/1.
vnfd(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VNFD').
:- rdf_meta neutron(o).
:- dynamic neutron/1.
neutron(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Neutron').
:- rdf_meta ipvlan(o).
:- dynamic ipvlan/1.
ipvlan(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IPVLAN').
:- rdf_meta flavorAccess(o).
:- dynamic flavorAccess/1.
flavorAccess(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#FlavorAccess').
:- rdf_meta networkSlice(o).
:- dynamic networkSlice/1.
networkSlice(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#NetworkSlice').
:- rdf_meta nsd(o).
:- dynamic nsd/1.
nsd(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#NSD').
:- rdf_meta macvlan(o).
:- dynamic macvlan/1.
macvlan(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#MACVLAN').
:- rdf_meta overlayNetwork(o).
:- dynamic overlayNetwork/1.
overlayNetwork(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OverlayNetwork').
:- rdf_meta https(o).
:- dynamic https/1.
https(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#HTTPS').
:- rdf_meta vnf(o).
:- dynamic vnf/1.
vnf(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VNF').
:- rdf_meta executionState(o).
:- dynamic executionState/1.
executionState(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#executionState').
:- rdf_meta accessMobilityManagementFunction(o).
:- dynamic accessMobilityManagementFunction/1.
accessMobilityManagementFunction(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#AccessMobilityManagementFunction').
:- rdf_meta nova(o).
:- dynamic nova/1.
nova(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Nova').
:- rdf_meta loadBalanceFunction(o).
:- dynamic loadBalanceFunction/1.
loadBalanceFunction(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#LoadBalanceFunction').
:- rdf_meta ospf(o).
:- dynamic ospf/1.
ospf(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OSPF').
:- rdf_meta icmPv6(o).
:- dynamic icmPv6/1.
icmPv6(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ICMPv6').
:- rdf_meta vdur(o).
:- dynamic vdur/1.
vdur(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VDUR').
:- rdf_meta terms(o).
:- dynamic terms/1.
terms(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Terms').
:- rdf_meta gNodeB(o).
:- dynamic gNodeB/1.
gNodeB(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#gNodeB').
:- rdf_meta ntp(o).
:- dynamic ntp/1.
ntp(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#NTP').
:- rdf_meta transmission(o).
:- dynamic transmission/1.
transmission(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Transmission').
:- rdf_meta veth(o).
:- dynamic veth/1.
veth(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VETH').
:- rdf_meta dhcp(o).
:- dynamic dhcp/1.
dhcp(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#DHCP').
:- rdf_meta physicalRouter(o).
:- dynamic physicalRouter/1.
physicalRouter(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PhysicalRouter').
:- rdf_meta hypervisor(o).
:- dynamic hypervisor/1.
hypervisor(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Hypervisor').
:- rdf_meta virtualNetworkInterface(o).
:- dynamic virtualNetworkInterface/1.
virtualNetworkInterface(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualNetworkInterface').
:- rdf_meta clusterTemplate(o).
:- dynamic clusterTemplate/1.
clusterTemplate(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ClusterTemplate').
:- rdf_meta userPlaneFunction(o).
:- dynamic userPlaneFunction/1.
userPlaneFunction(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#UserPlaneFunction').
:- rdf_meta application(o).
:- dynamic application/1.
application(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Application').
:- rdf_meta switchFunction(o).
:- dynamic switchFunction/1.
switchFunction(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#SwitchFunction').
:- rdf_meta interface(o).
:- dynamic interface/1.
interface(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Interface').
:- rdf_meta logicalNetwork(o).
:- dynamic logicalNetwork/1.
logicalNetwork(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#LogicalNetwork').
:- rdf_meta claim(o).
:- dynamic claim/1.
claim(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Claim').
:- rdf_meta stack(o).
:- dynamic stack/1.
stack(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Stack').
:- rdf_meta physicalDevice(o).
:- dynamic physicalDevice/1.
physicalDevice(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PhysicalDevice').
:- rdf_meta package(o).
:- dynamic package/1.
package(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Package').
:- rdf_meta virtualMachine(o).
:- dynamic virtualMachine/1.
virtualMachine(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualMachine').
:- rdf_meta ftp(o).
:- dynamic ftp/1.
ftp(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#FTP').
:- rdf_meta networkRepositoryFunction(o).
:- dynamic networkRepositoryFunction/1.
networkRepositoryFunction(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#NetworkRepositoryFunction').
:- rdf_meta magnumService(o).
:- dynamic magnumService/1.
magnumService(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#MagnumService').
:- rdf_meta volumeTypeAccess(o).
:- dynamic volumeTypeAccess/1.
volumeTypeAccess(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VolumeTypeAccess').
:- rdf_meta ipoib(o).
:- dynamic ipoib/1.
ipoib(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IPOIB').
:- rdf_meta hubFunction(o).
:- dynamic hubFunction/1.
hubFunction(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#HubFunction').
:- rdf_meta wiredNetworkInterface(o).
:- dynamic wiredNetworkInterface/1.
wiredNetworkInterface(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#WiredNetworkInterface').
:- rdf_meta ip(o).
:- dynamic ip/1.
ip(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IP').
:- rdf_meta functionChain(o).
:- dynamic functionChain/1.
functionChain(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#FunctionChain').
:- rdf_meta serviceFunction(o).
:- dynamic serviceFunction/1.
serviceFunction(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ServiceFunction').
:- rdf_meta openstackTerm(o).
:- dynamic openstackTerm/1.
openstackTerm(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OpenstackTerm').
:- rdf_meta host(o).
:- dynamic host/1.
host(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Host').
:- rdf_meta backendFunction(o).
:- dynamic backendFunction/1.
backendFunction(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#BackendFunction').
:- rdf_meta ptp(o).
:- dynamic ptp/1.
ptp(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PTP').
:- rdf_meta macvtap(o).
:- dynamic macvtap/1.
macvtap(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#MACVTAP').
:- rdf_meta openstack(o).
:- dynamic openstack/1.
openstack(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Openstack').
:- rdf_meta nst(o).
:- dynamic nst/1.
nst(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#NST').
:- rdf_meta wirelessNetworkInterface(o).
:- dynamic wirelessNetworkInterface/1.
wirelessNetworkInterface(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#WirelessNetworkInterface').
:- rdf_meta flavor(o).
:- dynamic flavor/1.
flavor(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Flavor').
:- rdf_meta http(o).
:- dynamic http/1.
http(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#HTTP').
:- rdf_meta protocol(o).
:- dynamic protocol/1.
protocol(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Protocol').
:- rdf_meta nslcm(o).
:- dynamic nslcm/1.
nslcm(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#NSLCM').
:- rdf_meta osmTerm(o).
:- dynamic osmTerm/1.
osmTerm(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OsmTerm').
:- rdf_meta bgpFunction(o).
:- dynamic bgpFunction/1.
bgpFunction(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#BGPFunction').
:- rdf_meta state(o).
:- dynamic state/1.
state(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#State').
:- rdf_meta dataCentre(o).
:- dynamic dataCentre/1.
dataCentre(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#DataCentre').
:- rdf_meta databaseFunction(o).
:- dynamic databaseFunction/1.
databaseFunction(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#DatabaseFunction').
:- rdf_meta namespace(o).
:- dynamic namespace/1.
namespace(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Namespace').
:- rdf_meta network(o).
:- dynamic network/1.
network(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Network').
:- rdf_meta unifiedDataManagementFunction(o).
:- dynamic unifiedDataManagementFunction/1.
unifiedDataManagementFunction(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#UnifiedDataManagementFunction').
:- rdf_meta onap(o).
:- dynamic onap/1.
onap(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ONAP').
:- rdf_meta resourceClaim(o).
:- dynamic resourceClaim/1.
resourceClaim(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ResourceClaim').
:- rdf_meta authenticationServerFunction(o).
:- dynamic authenticationServerFunction/1.
authenticationServerFunction(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#AuthenticationServerFunction').
:- rdf_meta kubernetes(o).
:- dynamic kubernetes/1.
kubernetes(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Kubernetes').
:- rdf_meta component(o).
:- dynamic component/1.
component(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Component').
:- rdf_meta osm(o).
:- dynamic osm/1.
osm(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OSM').
:- rdf_meta networkExposureFunction(o).
:- dynamic networkExposureFunction/1.
networkExposureFunction(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#NetworkExposureFunction').
:- rdf_meta udp(o).
:- dynamic udp/1.
udp(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#UDP').
:- rdf_meta volume(o).
:- dynamic volume/1.
volume(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Volume').
:- rdf_meta securityGroup(o).
:- dynamic securityGroup/1.
securityGroup(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#SecurityGroup').
:- rdf_meta mplsFunction(o).
:- dynamic mplsFunction/1.
mplsFunction(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#MPLSFunction').
:- rdf_meta image(o).
:- dynamic image/1.
image(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Image').
:- rdf_meta virtualEnvironment(o).
:- dynamic virtualEnvironment/1.
virtualEnvironment(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualEnvironment').
:- rdf_meta metroSwitch(o).
:- dynamic metroSwitch/1.
metroSwitch(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#MetroSwitch').
:- rdf_meta nlmon(o).
:- dynamic nlmon/1.
nlmon(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#NLMON').
:- rdf_meta wiredNetwork(o).
:- dynamic wiredNetwork/1.
wiredNetwork(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#WiredNetwork').
:- rdf_meta unikernel(o).
:- dynamic unikernel/1.
unikernel(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Unikernel').
:- rdf_meta routeFunction(o).
:- dynamic routeFunction/1.
routeFunction(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#RouteFunction').
:- rdf_meta firewallFunction(o).
:- dynamic firewallFunction/1.
firewallFunction(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#FirewallFunction').
:- rdf_meta class(o).
:- dynamic class/1.
class(Q) :- rdfs_individual_of(Q, 'http://www.w3.org/2002/07/owl#Class').
:- rdf_meta physicalSwitch(o).
:- dynamic physicalSwitch/1.
physicalSwitch(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PhysicalSwitch').
:- rdf_meta radioAccessFunction(o).
:- dynamic radioAccessFunction/1.
radioAccessFunction(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#RadioAccessFunction').
:- rdf_meta icmp(o).
:- dynamic icmp/1.
icmp(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ICMP').
:- rdf_meta service(o).
:- dynamic service/1.
service(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Service').
:- rdf_meta vnfr(o).
:- dynamic vnfr/1.
vnfr(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VNFR').
:- rdf_meta mac(o).
:- dynamic mac/1.
mac(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#MAC').
:- rdf_meta internalNetwork(o).
:- dynamic internalNetwork/1.
internalNetwork(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#InternalNetwork').
:- rdf_meta executionEnvironment(o).
:- dynamic executionEnvironment/1.
executionEnvironment(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ExecutionEnvironment').
:- rdf_meta pop(o).
:- dynamic pop/1.
pop(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#POP').
:- rdf_meta hostFunction(o).
:- dynamic hostFunction/1.
hostFunction(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#HostFunction').
:- rdf_meta ssh(o).
:- dynamic ssh/1.
ssh(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#SSH').
:- rdf_meta coreSwitch(o).
:- dynamic coreSwitch/1.
coreSwitch(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#CoreSwitch').
:- rdf_meta vlan(o).
:- dynamic vlan/1.
vlan(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VLAN').
:- rdf_meta tcp(o).
:- dynamic tcp/1.
tcp(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#TCP').
:- rdf_meta iPv6(o).
:- dynamic iPv6/1.
iPv6(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IPv6').
:- rdf_meta orchestrator(o).
:- dynamic orchestrator/1.
orchestrator(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Orchestrator').
:- rdf_meta container(o).
:- dynamic container/1.
container(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Container').
:- rdf_meta physicalHub(o).
:- dynamic physicalHub/1.
physicalHub(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PhysicalHub').
:- rdf_meta electricity(o).
:- dynamic electricity/1.
electricity(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Electricity').
:- rdf_meta tls(o).
:- dynamic tls/1.
tls(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#TLS').
:- rdf_meta function(o).
:- dynamic function/1.
function(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Function').
:- rdf_meta igmp(o).
:- dynamic igmp/1.
igmp(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IGMP').
:- rdf_meta smtp(o).
:- dynamic smtp/1.
smtp(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#SMTP').
:- rdf_meta nsilcm(o).
:- dynamic nsilcm/1.
nsilcm(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#NSILCM').
:- rdf_meta device(o).
:- dynamic device/1.
device(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Device').
:- rdf_meta computeLimits(o).
:- dynamic computeLimits/1.
computeLimits(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ComputeLimits').
:- rdf_meta deploymentUnit(o).
:- dynamic deploymentUnit/1.
deploymentUnit(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#DeploymentUnit').
:- rdf_meta virtualNetwork(o).
:- dynamic virtualNetwork/1.
virtualNetwork(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualNetwork').
:- rdf_meta ldap(o).
:- dynamic ldap/1.
ldap(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#LDAP').
:- rdf_meta pdu(o).
:- dynamic pdu/1.
pdu(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PDU').
:- rdf_meta sessionManagementFunction(o).
:- dynamic sessionManagementFunction/1.
sessionManagementFunction(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#SessionManagementFunction').
:- rdf_meta networkSliceSelectionFunction(o).
:- dynamic networkSliceSelectionFunction/1.
networkSliceSelectionFunction(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#NetworkSliceSelectionFunction').
:- rdf_meta keypair(o).
:- dynamic keypair/1.
keypair(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Keypair').
:- rdf_meta serverUsage(o).
:- dynamic serverUsage/1.
serverUsage(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ServerUsage').
:- rdf_meta iPv4(o).
:- dynamic iPv4/1.
iPv4(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IPv4').
:- rdf_meta vcan(o).
:- dynamic vcan/1.
vcan(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VCAN').
:- rdf_meta ipNetwork(o).
:- dynamic ipNetwork/1.
ipNetwork(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IPNetwork').
:- rdf_meta vxcan(o).
:- dynamic vxcan/1.
vxcan(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VXCAN').
:- rdf_meta wire(o).
:- dynamic wire/1.
wire(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Wire').
:- rdf_meta maCsec(o).
:- dynamic maCsec/1.
maCsec(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#MACsec').
:- rdf_meta oci(o).
:- dynamic oci/1.
oci(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OCI').
:- rdf_meta irSenderReceiver(o).
:- dynamic irSenderReceiver/1.
irSenderReceiver(Q) :- rdfs_individual_of(Q, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IRSenderReceiver').
:- rdf_meta hasDeploymentUnit(o, o).
:- dynamic hasDeploymentUnit/2.
hasDeploymentUnit(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#hasDeploymentUnit', Y).
hasDeploymentUnit(X, Y) :- isDeploymentUnitOf(Y, X).
:- rdf_meta isOf(o, o).
:- dynamic isOf/2.
isOf(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isOf', Y).
isOf(X, Y) :- isDeploymentUnitOf(X, Y).
isOf(X, Y) :- isInstanceOf(X, Y).
isOf(X, Y) :- isInterfaceOf(X, Y).
isOf(X, Y) :- isPackageOf(X, Y).
:- table radioLink/2.
:- rdf_meta radioLink(o, o).
:- dynamic radioLink/2.
radioLink(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#radioLink', Y).
radioLink(X, Y) :- radioLink(Y, X).
:- rdf_meta target(o, o).
:- dynamic target/2.
target(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#target', Y).
:- rdf_meta supportsProtocol(o, o).
:- dynamic supportsProtocol/2.
supportsProtocol(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#supportsProtocol', Y).
:- rdf_meta lacksExecutionMachine(o, o).
:- dynamic lacksExecutionMachine/2.
lacksExecutionMachine(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#lacksExecutionMachine', Y).
:- rdf_meta deviceLocation(o, o).
:- dynamic deviceLocation/2.
deviceLocation(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#deviceLocation', Y).
:- rdf_meta country(o, o).
:- dynamic country/2.
country(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#country', Y).
:- rdf_meta lacksPackage(o, o).
:- dynamic lacksPackage/2.
lacksPackage(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#lacksPackage', Y).
:- rdf_meta hasPhysicalInterface(o, o).
:- dynamic hasPhysicalInterface/2.
hasPhysicalInterface(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#hasPhysicalInterface', Y).
:- rdf_meta hasExecutionMachine(o, o).
:- dynamic hasExecutionMachine/2.
hasExecutionMachine(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#hasExecutionMachine', Y).
:- rdf_meta compute(o, o).
:- dynamic compute/2.
compute(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#compute', Y).
:- rdf_meta hasInstance(o, o).
:- dynamic hasInstance/2.
hasInstance(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#hasInstance', Y).
hasInstance(X, Y) :- isInstanceOf(Y, X).
:- rdf_meta isDeploymentUnitOf(o, o).
:- dynamic isDeploymentUnitOf/2.
isDeploymentUnitOf(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isDeploymentUnitOf', Y).
:- rdf_meta isRunningOn(o, o).
:- dynamic isRunningOn/2.
isRunningOn(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isRunningOn', Y).
:- rdf_meta isDoing(o, o).
:- dynamic isDoing/2.
isDoing(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isDoing', Y).
isDoing(X, Y) :- isExecuting(X, Y).
:- rdf_meta id(o, o).
:- dynamic id/2.
id(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#id', Y).
id(X, Y) :- imei(X, Y).
:- rdf_meta isInstanceOf(o, o).
:- dynamic isInstanceOf/2.
isInstanceOf(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isInstanceOf', Y).
:- table connected/2.
:- rdf_meta connected(o, o).
:- dynamic connected/2.
connected(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#connected', Y).
connected(X,Z) :- connected(X, Y), connected(Y, Z).
connected(X, Y) :- connected(Y, X).
connected(X, Y) :- connectedByWire(X, Y).
:- rdf_meta lacksInstance(o, o).
:- dynamic lacksInstance/2.
lacksInstance(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#lacksInstance', Y).
:- rdf_meta network(o, o).
:- dynamic network/2.
network(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#network', Y).
network(X, Y) :- interfaceProperty(X, Y).
:- rdf_meta role(o, o).
:- dynamic role/2.
role(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#role', Y).
:- rdf_meta isInterfaceOf(o, o).
:- dynamic isInterfaceOf/2.
isInterfaceOf(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isInterfaceOf', Y).
isInterfaceOf(X, Y) :- isPhysicalInterfaceOf(X, Y).
isInterfaceOf(X, Y) :- isVirtualInterfaceOf(X, Y).
:- rdf_meta lacks(o, o).
:- dynamic lacks/2.
lacks(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#lacks', Y).
lacks(X, Y) :- lacksExecutionMachine(X, Y).
lacks(X, Y) :- lacksPackage(X, Y).
lacks(X, Y) :- lacksInstance(X, Y).
:- rdf_meta isOn(o, o).
:- dynamic isOn/2.
isOn(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isOn', Y).
isOn(X, Y) :- isRunningOn(X, Y).
:- rdf_meta topDataProperty(o, o).
:- dynamic topDataProperty/2.
topDataProperty(X, Y) :- rdf_has(X, 'http://www.w3.org/2002/07/owl#topDataProperty', Y).
topDataProperty(X, Y) :- id(X, Y).
topDataProperty(X, Y) :- network(X, Y).
topDataProperty(X, Y) :- role(X, Y).
:- rdf_meta existsOn(o, o).
:- dynamic existsOn/2.
existsOn(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#existsOn', Y).
:- rdf_meta supports(o, o).
:- dynamic supports/2.
supports(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#supports', Y).
supports(X, Y) :- supportsProtocol(X, Y).
:- rdf_meta ownsClaim(o, o).
:- dynamic ownsClaim/2.
ownsClaim(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ownsClaim', Y).
:- rdf_meta ownershipProperty(o, o).
:- dynamic ownershipProperty/2.
ownershipProperty(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ownershipProperty', Y).
ownershipProperty(X, Y) :- ownsClaim(X, Y).
:- rdf_meta hasVirtualInterface(o, o).
:- dynamic hasVirtualInterface/2.
hasVirtualInterface(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#hasVirtualInterface', Y).
:- rdf_meta interfaceProperty(o, o).
:- dynamic interfaceProperty/2.
interfaceProperty(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#interfaceProperty', Y).
:- rdf_meta isPhysicalInterfaceOf(o, o).
:- dynamic isPhysicalInterfaceOf/2.
isPhysicalInterfaceOf(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isPhysicalInterfaceOf', Y).
:- rdf_meta hasInterface(o, o).
:- dynamic hasInterface/2.
hasInterface(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#hasInterface', Y).
hasInterface(X, Y) :- hasPhysicalInterface(X, Y).
hasInterface(X, Y) :- hasVirtualInterface(X, Y).
hasInterface(X, Y) :- isInterfaceOf(Y, X).
:- rdf_meta link(o, o).
:- dynamic link/2.
link(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#link', Y).
link(X, Y) :- radioLink(X, Y).
link(X, Y) :- physicalLink(X, Y).
:- rdf_meta isVirtualInterfaceOf(o, o).
:- dynamic isVirtualInterfaceOf/2.
isVirtualInterfaceOf(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isVirtualInterfaceOf', Y).
:- table physicalLink/2.
:- rdf_meta physicalLink(o, o).
:- dynamic physicalLink/2.
physicalLink(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#physicalLink', Y).
physicalLink(X, Y) :- physicalLink(Y, X).
:- rdf_meta hasPackage(o, o).
:- dynamic hasPackage/2.
hasPackage(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#hasPackage', Y).
hasPackage(X, Y) :- isPackageOf(Y, X).
:- rdf_meta claimTarget(o, o).
:- dynamic claimTarget/2.
claimTarget(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#claimTarget', Y).
:- rdf_meta hasFunction(o, o).
:- dynamic hasFunction/2.
hasFunction(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#hasFunction', Y).
:- rdf_meta ownedBy(o, o).
:- dynamic ownedBy/2.
ownedBy(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ownedBy', Y).
:- rdf_meta has(o, o).
:- dynamic has/2.
has(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#has', Y).
has(X, Y) :- hasDeploymentUnit(X, Y).
has(X, Y) :- hasExecutionMachine(X, Y).
has(X, Y) :- hasInstance(X, Y).
has(X, Y) :- hasInterface(X, Y).
has(X, Y) :- hasPackage(X, Y).
has(X, Y) :- hasFunction(X, Y).
:- rdf_meta isPackageOf(o, o).
:- dynamic isPackageOf/2.
isPackageOf(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isPackageOf', Y).
:- rdf_meta report(o, o).
:- dynamic report/2.
report(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#report', Y).
:- rdf_meta isExecuting(o, o).
:- dynamic isExecuting/2.
isExecuting(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isExecuting', Y).
isExecuting(X, Y) :- isRunningOn(Y, X).
:- rdf_meta descriptionProperty(o, o).
:- dynamic descriptionProperty/2.
descriptionProperty(X, Y) :- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#descriptionProperty', Y).
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
:- dynamic vcpuResource/2.
vcpuResource(X, Y):- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#vcpuResource', Y).
:- dynamic webPath/2.
webPath(X, Y):- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#webPath', Y).
:- dynamic vcpuUtilization/2.
vcpuUtilization(X, Y):- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#vcpuUtilization', Y).
:- dynamic ipAddress/2.
ipAddress(X, Y):- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ipAddress', Y).
:- dynamic storageResource/2.
storageResource(X, Y):- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#storageResource', Y).
:- dynamic resourceUtilization/2.
resourceUtilization(X, Y):- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#resourceUtilization', Y).
:- dynamic ipv6Address/2.
ipv6Address(X, Y):- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ipv6Address', Y).
:- dynamic address/2.
address(X, Y):- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#address', Y).
:- dynamic memoryUtilization/2.
memoryUtilization(X, Y):- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#memoryUtilization', Y).
:- dynamic macAddress/2.
macAddress(X, Y):- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#macAddress', Y).
:- dynamic cpuUtilization/2.
cpuUtilization(X, Y):- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#cpuUtilization', Y).
:- dynamic bandwidth/2.
bandwidth(X, Y):- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#bandwidth', Y).
:- dynamic resourceDescription/2.
resourceDescription(X, Y):- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#resourceDescription', Y).
:- dynamic storageUtilization/2.
storageUtilization(X, Y):- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#storageUtilization', Y).
:- dynamic port/2.
port(X, Y):- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#port', Y).
:- dynamic memoryResource/2.
memoryResource(X, Y):- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#memoryResource', Y).
:- dynamic ipv4Address/2.
ipv4Address(X, Y):- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ipv4Address', Y).
:- dynamic path/2.
path(X, Y):- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#path', Y).
:- dynamic storagePath/2.
storagePath(X, Y):- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#storagePath', Y).
:- dynamic directoryPath/2.
directoryPath(X, Y):- rdf_has(X, 'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#directoryPath', Y).
