/*
:- table 'Error1'/1.
:- table 'Application'/1.
:- table 'BGP'/1.
:- table 'BackendFunction'/1.
:- table 'ClusterTemplate'/1.
:- table 'Component'/1.
:- table 'ComputeLimits'/1.
:- table 'ComputeUsage'/1.
:- table 'Container'/1.
:- table 'DHCP'/1.
:- table 'DNS'/1.
:- table 'DatabaseFunction'/1.
:- table 'DeploymentUnit'/1.
:- table 'Device'/1.
:- table 'Electricity'/1.
:- table 'ExecutionEnvironment'/1.
:- table 'FTP'/1.
:- table 'FirewallFunction'/1.
:- table 'Flavor'/1.
:- table 'FlavorAccess'/1.
:- table 'FloatingIP'/1.
:- table 'Function'/1.
:- table 'HTTP'/1.
:- table 'HTTPS'/1.
:- table 'HubFunction'/1.
:- table 'Hypervisor'/1.
:- table 'ICMP'/1.
:- table 'ICMPv6'/1.
:- table 'IGMP'/1.
:- table 'IMAP'/1.
:- table 'IP'/1.
:- table 'IPNetwork'/1.
:- table 'IPOIB'/1.
:- table 'IPSec'/1.
:- table 'IPVLAN'/1.
:- table 'IPVTAP'/1.
:- table 'IPv4'/1.
:- table 'IPv6'/1.
:- table 'IRSenderReceiver'/1.
:- table 'Image'/1.
:- table 'Interface'/1.
:- table 'InternalNetwork'/1.
:- table 'KVM'/1.
:- table 'Keypair'/1.
:- table 'Kubernetes'/1.
:- table 'LDAP'/1.
:- table 'LXD'/1.
:- table 'LinuxBridge'/1.
:- table 'LoadBalanceFunction'/1.
:- table 'Location'/1.
:- table 'MAC'/1.
:- table 'MACVLAN'/1.
:- table 'MACVTAP'/1.
:- table 'MACsec'/1.
:- table 'MagnumService'/1.
:- table 'MiddleboxFunction'/1.
:- table 'NLMON'/1.
:- table 'NSD'/1.
:- table 'NSILCM'/1.
:- table 'NSLCM'/1.
:- table 'NST'/1.
:- table 'NTP'/1.
:- table 'Namespace'/1.
:- table 'Network'/1.
:- table 'Neutron'/1.
:- table 'Nova'/1.
:- table 'OCI'/1.
:- table 'ONAP'/1.
:- table 'OS'/1.
:- table 'OSM'/1.
:- table 'OSPF'/1.
:- table 'OpenVSwitch'/1.
:- table 'Openstack'/1.
:- table 'OpenstackTerm'/1.
:- table 'Orchestrator'/1.
:- table 'OsmTerm'/1.
:- table 'OverlayNetwork'/1.
:- table 'PDU'/1.
:- table 'POP'/1.
:- table 'PPP'/1.
:- table 'PTP'/1.
:- table 'Package'/1.
:- table 'PhysicalDevice'/1.
:- table 'PhysicalHub'/1.
:- table 'PhysicalMachine'/1.
:- table 'PhysicalNetwork'/1.
:- table 'PhysicalRouter'/1.
:- table 'PhysicalSwitch'/1.
:- table 'Protocol'/1.
:- table 'RTSP'/1.
:- table 'RouteFunction'/1.
:- table 'SMTP'/1.
:- table 'SNMP'/1.
:- table 'SSH'/1.
:- table 'SecurityGroup'/1.
:- table 'SecurityGroupRule'/1.
:- table 'Server'/1.
:- table 'ServerUsage'/1.
:- table 'Service'/1.
:- table 'ServiceFunctionChain'/1.
:- table 'Stack'/1.
:- table 'SwitchFunction'/1.
:- table 'TCP'/1.
:- table 'Terms'/1.
:- table 'Transmission'/1.
:- table 'UDP'/1.
:- table 'Unikernel'/1.
:- table 'VCAN'/1.
:- table 'VDU'/1.
:- table 'VDUR'/1.
:- table 'VETH'/1.
:- table 'VLAN'/1.
:- table 'VNF'/1.
:- table 'VNFD'/1.
:- table 'VNFLCM'/1.
:- table 'VNFR'/1.
:- table 'VXCAN'/1.
:- table 'VirtualDevice'/1.
:- table 'VirtualEnvironment'/1.
:- table 'VirtualMachine'/1.
:- table 'VirtualNetwork'/1.
:- table 'VirtualNetworkInterface'/1.
:- table 'Volume'/1.
:- table 'VolumeType'/1.
:- table 'VolumeTypeAccess'/1.
:- table 'VxLAN'/1.
:- table 'Wire'/1.
:- table 'WiredNetwork'/1.
:- table 'WiredNetworkInterface'/1.
:- table 'WirelessNetwork'/1.
:- table 'WirelessNetworkInterface'/1.
:- table 'Xen'/1.
:- table executionState/1.
:- table 'TLS/SSL'/1.
:- table compute/2.
:- table executionState/2.
:- table interfaceProperty/2.
:- table ipAddress/2.
:- table macAddress/2.
:- table network/2.
:- table role/2.
:- table spread/2.
:- table compute/2.
:- table connected/2.
:- table connectedByWire/2.
:- table deployedOnMachine/2.
:- table descriptionProperty/2.
:- table executionState/2.
:- table existsOn/2.
:- table has/2.
:- table hasDeploymentUnit/2.
:- table hasExecutionMachine/2.
:- table hasInstance/2.
:- table hasInterface/2.
:- table hasNetworkFunction/2.
:- table hasPhysicalInterface/2.
:- table hasVirtualInterface/2.
:- table interfaceProperty/2.
:- table ipAddress/2.
:- table isDeploymentUnitOf/2.
:- table isDoing/2.
:- table isExecuting/2.
:- table isInstanceOf/2.
:- table isInterfaceOf/2.
:- table isOf/2.
:- table isOn/2.
:- table isPhysicalInterfaceOf/2.
:- table isRunningOn/2.
:- table isVirtualInterfaceOf/2.
:- table lacks/2.
:- table lacksExecutionMachine/2.
:- table lacksInstance/2.
:- table lacksPackage/2.
:- table macAddress/2.
:- table network/2.
:- table report/2.
:- table role/2.
:- table supports/2.
:- table supportsProtocol/2.
:- table target/2.
:- table topDataProperty/2.
:- table label/2.
:- table comment/2.
*/

:- dynamic 'Error1'/1.
:- dynamic 'Application'/1.
:- dynamic 'BGP'/1.
:- dynamic 'BackendFunction'/1.
:- dynamic 'ClusterTemplate'/1.
:- dynamic 'Component'/1.
:- dynamic 'ComputeLimits'/1.
:- dynamic 'ComputeUsage'/1.
:- dynamic 'Container'/1.
:- dynamic 'DHCP'/1.
:- dynamic 'DNS'/1.
:- dynamic 'DatabaseFunction'/1.
:- dynamic 'DeploymentUnit'/1.
:- dynamic 'Device'/1.
:- dynamic 'Electricity'/1.
:- dynamic 'ExecutionEnvironment'/1.
:- dynamic 'FTP'/1.
:- dynamic 'FirewallFunction'/1.
:- dynamic 'Flavor'/1.
:- dynamic 'FlavorAccess'/1.
:- dynamic 'FloatingIP'/1.
:- dynamic 'Function'/1.
:- dynamic 'HTTP'/1.
:- dynamic 'HTTPS'/1.
:- dynamic 'HubFunction'/1.
:- dynamic 'Hypervisor'/1.
:- dynamic 'ICMP'/1.
:- dynamic 'ICMPv6'/1.
:- dynamic 'IGMP'/1.
:- dynamic 'IMAP'/1.
:- dynamic 'IP'/1.
:- dynamic 'IPNetwork'/1.
:- dynamic 'IPOIB'/1.
:- dynamic 'IPSec'/1.
:- dynamic 'IPVLAN'/1.
:- dynamic 'IPVTAP'/1.
:- dynamic 'IPv4'/1.
:- dynamic 'IPv6'/1.
:- dynamic 'IRSenderReceiver'/1.
:- dynamic 'Image'/1.
:- dynamic 'Interface'/1.
:- dynamic 'InternalNetwork'/1.
:- dynamic 'KVM'/1.
:- dynamic 'Keypair'/1.
:- dynamic 'Kubernetes'/1.
:- dynamic 'LDAP'/1.
:- dynamic 'LXD'/1.
:- dynamic 'LinuxBridge'/1.
:- dynamic 'LoadBalanceFunction'/1.
:- dynamic 'Location'/1.
:- dynamic 'MAC'/1.
:- dynamic 'MACVLAN'/1.
:- dynamic 'MACVTAP'/1.
:- dynamic 'MACsec'/1.
:- dynamic 'MagnumService'/1.
:- dynamic 'MiddleboxFunction'/1.
:- dynamic 'NLMON'/1.
:- dynamic 'NSD'/1.
:- dynamic 'NSILCM'/1.
:- dynamic 'NSLCM'/1.
:- dynamic 'NST'/1.
:- dynamic 'NTP'/1.
:- dynamic 'Namespace'/1.
:- dynamic 'Network'/1.
:- dynamic 'Neutron'/1.
:- dynamic 'Nova'/1.
:- dynamic 'OCI'/1.
:- dynamic 'ONAP'/1.
:- dynamic 'OS'/1.
:- dynamic 'OSM'/1.
:- dynamic 'OSPF'/1.
:- dynamic 'OpenVSwitch'/1.
:- dynamic 'Openstack'/1.
:- dynamic 'OpenstackTerm'/1.
:- dynamic 'Orchestrator'/1.
:- dynamic 'OsmTerm'/1.
:- dynamic 'OverlayNetwork'/1.
:- dynamic 'PDU'/1.
:- dynamic 'POP'/1.
:- dynamic 'PPP'/1.
:- dynamic 'PTP'/1.
:- dynamic 'Package'/1.
:- dynamic 'PhysicalDevice'/1.
:- dynamic 'PhysicalHub'/1.
:- dynamic 'PhysicalMachine'/1.
:- dynamic 'PhysicalNetwork'/1.
:- dynamic 'PhysicalRouter'/1.
:- dynamic 'PhysicalSwitch'/1.
:- dynamic 'Protocol'/1.
:- dynamic 'RTSP'/1.
:- dynamic 'RouteFunction'/1.
:- dynamic 'SMTP'/1.
:- dynamic 'SNMP'/1.
:- dynamic 'SSH'/1.
:- dynamic 'SecurityGroup'/1.
:- dynamic 'SecurityGroupRule'/1.
:- dynamic 'Server'/1.
:- dynamic 'ServerUsage'/1.
:- dynamic 'Service'/1.
:- dynamic 'ServiceFunctionChain'/1.
:- dynamic 'Stack'/1.
:- dynamic 'SwitchFunction'/1.
:- dynamic 'TCP'/1.
:- dynamic 'Terms'/1.
:- dynamic 'Transmission'/1.
:- dynamic 'UDP'/1.
:- dynamic 'Unikernel'/1.
:- dynamic 'VCAN'/1.
:- dynamic 'VDU'/1.
:- dynamic 'VDUR'/1.
:- dynamic 'VETH'/1.
:- dynamic 'VLAN'/1.
:- dynamic 'VNF'/1.
:- dynamic 'VNFD'/1.
:- dynamic 'VNFLCM'/1.
:- dynamic 'VNFR'/1.
:- dynamic 'VXCAN'/1.
:- dynamic 'VirtualDevice'/1.
:- dynamic 'VirtualEnvironment'/1.
:- dynamic 'VirtualMachine'/1.
:- dynamic 'VirtualNetwork'/1.
:- dynamic 'VirtualNetworkInterface'/1.
:- dynamic 'Volume'/1.
:- dynamic 'VolumeType'/1.
:- dynamic 'VolumeTypeAccess'/1.
:- dynamic 'VxLAN'/1.
:- dynamic 'Wire'/1.
:- dynamic 'WiredNetwork'/1.
:- dynamic 'WiredNetworkInterface'/1.
:- dynamic 'WirelessNetwork'/1.
:- dynamic 'WirelessNetworkInterface'/1.
:- dynamic 'Xen'/1.
:- dynamic executionState/1.
:- dynamic 'TLS/SSL'/1.
:- dynamic compute/2.
:- dynamic executionState/2.
:- dynamic interfaceProperty/2.
:- dynamic ipAddress/2.
:- dynamic macAddress/2.
:- dynamic network/2.
:- dynamic role/2.
:- dynamic spread/2.
:- dynamic compute/2.
:- dynamic connected/2.
:- dynamic connectedByWire/2.
:- dynamic deployedOnMachine/2.
:- dynamic descriptionProperty/2.
:- dynamic executionState/2.
:- dynamic existsOn/2.
:- dynamic has/2.
:- dynamic hasDeploymentUnit/2.
:- dynamic hasExecutionMachine/2.
:- dynamic hasInstance/2.
:- dynamic hasInterface/2.
:- dynamic hasNetworkFunction/2.
:- dynamic hasPhysicalInterface/2.
:- dynamic hasVirtualInterface/2.
:- dynamic interfaceProperty/2.
:- dynamic ipAddress/2.
:- dynamic isDeploymentUnitOf/2.
:- dynamic isDoing/2.
:- dynamic isExecuting/2.
:- dynamic isInstanceOf/2.
:- dynamic isInterfaceOf/2.
:- dynamic isOf/2.
:- dynamic isOn/2.
:- dynamic isPhysicalInterfaceOf/2.
:- dynamic isRunningOn/2.
:- dynamic isVirtualInterfaceOf/2.
:- dynamic lacks/2.
:- dynamic lacksExecutionMachine/2.
:- dynamic lacksInstance/2.
:- dynamic lacksPackage/2.
:- dynamic macAddress/2.
:- dynamic network/2.
:- dynamic report/2.
:- dynamic role/2.
:- dynamic supports/2.
:- dynamic supportsProtocol/2.
:- dynamic target/2.
:- dynamic topDataProperty/2.
:- dynamic label/2.
:- dynamic comment/2.

:- discontiguous('Thing'/1).
:- discontiguous('Error1'/1).
:- discontiguous('Application'/1).
:- discontiguous('BGP'/1).
:- discontiguous('BackendFunction'/1).
:- discontiguous('ClusterTemplate'/1).
:- discontiguous('Component'/1).
:- discontiguous('ComputeLimits'/1).
:- discontiguous('ComputeUsage'/1).
:- discontiguous('Container'/1).
:- discontiguous('DHCP'/1).
:- discontiguous('DNS'/1).
:- discontiguous('DatabaseFunction'/1).
:- discontiguous('DeploymentUnit'/1).
:- discontiguous('Device'/1).
:- discontiguous('Electricity'/1).
:- discontiguous('ExecutionEnvironment'/1).
:- discontiguous('FTP'/1).
:- discontiguous('FirewallFunction'/1).
:- discontiguous('Flavor'/1).
:- discontiguous('FlavorAccess'/1).
:- discontiguous('FloatingIP'/1).
:- discontiguous('Function'/1).
:- discontiguous('HTTP'/1).
:- discontiguous('HTTPS'/1).
:- discontiguous('HubFunction'/1).
:- discontiguous('Hypervisor'/1).
:- discontiguous('ICMP'/1).
:- discontiguous('ICMPv6'/1).
:- discontiguous('IGMP'/1).
:- discontiguous('IMAP'/1).
:- discontiguous('IP'/1).
:- discontiguous('IPNetwork'/1).
:- discontiguous('IPOIB'/1).
:- discontiguous('IPSec'/1).
:- discontiguous('IPVLAN'/1).
:- discontiguous('IPVTAP'/1).
:- discontiguous('IPv4'/1).
:- discontiguous('IPv6'/1).
:- discontiguous('IRSenderReceiver'/1).
:- discontiguous('Image'/1).
:- discontiguous('Interface'/1).
:- discontiguous('InternalNetwork'/1).
:- discontiguous('KVM'/1).
:- discontiguous('Keypair'/1).
:- discontiguous('Kubernetes'/1).
:- discontiguous('LDAP'/1).
:- discontiguous('LXD'/1).
:- discontiguous('LinuxBridge'/1).
:- discontiguous('LoadBalanceFunction'/1).
:- discontiguous('Location'/1).
:- discontiguous('MAC'/1).
:- discontiguous('MACVLAN'/1).
:- discontiguous('MACVTAP'/1).
:- discontiguous('MACsec'/1).
:- discontiguous('MagnumService'/1).
:- discontiguous('MiddleboxFunction'/1).
:- discontiguous('NLMON'/1).
:- discontiguous('NSD'/1).
:- discontiguous('NSILCM'/1).
:- discontiguous('NSLCM'/1).
:- discontiguous('NST'/1).
:- discontiguous('NTP'/1).
:- discontiguous('Namespace'/1).
:- discontiguous('Network'/1).
:- discontiguous('Neutron'/1).
:- discontiguous('Nova'/1).
:- discontiguous('OCI'/1).
:- discontiguous('ONAP'/1).
:- discontiguous('OS'/1).
:- discontiguous('OSM'/1).
:- discontiguous('OSPF'/1).
:- discontiguous('OpenVSwitch'/1).
:- discontiguous('Openstack'/1).
:- discontiguous('OpenstackTerm'/1).
:- discontiguous('Orchestrator'/1).
:- discontiguous('OsmTerm'/1).
:- discontiguous('OverlayNetwork'/1).
:- discontiguous('PDU'/1).
:- discontiguous('POP'/1).
:- discontiguous('PPP'/1).
:- discontiguous('PTP'/1).
:- discontiguous('Package'/1).
:- discontiguous('PhysicalDevice'/1).
:- discontiguous('PhysicalHub'/1).
:- discontiguous('PhysicalMachine'/1).
:- discontiguous('PhysicalNetwork'/1).
:- discontiguous('PhysicalRouter'/1).
:- discontiguous('PhysicalSwitch'/1).
:- discontiguous('Protocol'/1).
:- discontiguous('RTSP'/1).
:- discontiguous('RouteFunction'/1).
:- discontiguous('SMTP'/1).
:- discontiguous('SNMP'/1).
:- discontiguous('SSH'/1).
:- discontiguous('SecurityGroup'/1).
:- discontiguous('SecurityGroupRule'/1).
:- discontiguous('Server'/1).
:- discontiguous('ServerUsage'/1).
:- discontiguous('Service'/1).
:- discontiguous('ServiceFunctionChain'/1).
:- discontiguous('Stack'/1).
:- discontiguous('SwitchFunction'/1).
:- discontiguous('TCP'/1).
:- discontiguous('Terms'/1).
:- discontiguous('Transmission'/1).
:- discontiguous('UDP'/1).
:- discontiguous('Unikernel'/1).
:- discontiguous('VCAN'/1).
:- discontiguous('VDU'/1).
:- discontiguous('VDUR'/1).
:- discontiguous('VETH'/1).
:- discontiguous('VLAN'/1).
:- discontiguous('VNF'/1).
:- discontiguous('VNFD'/1).
:- discontiguous('VNFLCM'/1).
:- discontiguous('VNFR'/1).
:- discontiguous('VXCAN'/1).
:- discontiguous('VirtualDevice'/1).
:- discontiguous('VirtualEnvironment'/1).
:- discontiguous('VirtualMachine'/1).
:- discontiguous('VirtualNetwork'/1).
:- discontiguous('VirtualNetworkInterface'/1).
:- discontiguous('Volume'/1).
:- discontiguous('VolumeType'/1).
:- discontiguous('VolumeTypeAccess'/1).
:- discontiguous('VxLAN'/1).
:- discontiguous('Wire'/1).
:- discontiguous('WiredNetwork'/1).
:- discontiguous('WiredNetworkInterface'/1).
:- discontiguous('WirelessNetwork'/1).
:- discontiguous('WirelessNetworkInterface'/1).
:- discontiguous('Xen'/1).
:- discontiguous(executionState/1).
:- discontiguous('TLS/SSL'/1).
:- discontiguous(compute/2).
:- discontiguous(executionState/2).
:- discontiguous(interfaceProperty/2).
:- discontiguous(ipAddress/2).
:- discontiguous(macAddress/2).
:- discontiguous(network/2).
:- discontiguous(role/2).
:- discontiguous(spread/2).
:- discontiguous(compute/2).
:- discontiguous(connected/2).
:- discontiguous(connectedByWire/2).
:- discontiguous(deployedOnMachine/2).
:- discontiguous(descriptionProperty/2).
:- discontiguous(executionState/2).
:- discontiguous(existsOn/2).
:- discontiguous(has/2).
:- discontiguous(hasDeploymentUnit/2).
:- discontiguous(hasExecutionMachine/2).
:- discontiguous(hasInstance/2).
:- discontiguous(hasInterface/2).
:- discontiguous(hasNetworkFunction/2).
:- discontiguous(hasPhysicalInterface/2).
:- discontiguous(hasVirtualInterface/2).
:- discontiguous(interfaceProperty/2).
:- discontiguous(ipAddress/2).
:- discontiguous(isDeploymentUnitOf/2).
:- discontiguous(isDoing/2).
:- discontiguous(isExecuting/2).
:- discontiguous(isInstanceOf/2).
:- discontiguous(isInterfaceOf/2).
:- discontiguous(isOf/2).
:- discontiguous(isOn/2).
:- discontiguous(isPhysicalInterfaceOf/2).
:- discontiguous(isRunningOn/2).
:- discontiguous(isVirtualInterfaceOf/2).
:- discontiguous(lacks/2).
:- discontiguous(lacksExecutionMachine/2).
:- discontiguous(lacksInstance/2).
:- discontiguous(lacksPackage/2).
:- discontiguous(macAddress/2).
:- discontiguous(network/2).
:- discontiguous(report/2).
:- discontiguous(role/2).
:- discontiguous(supports/2).
:- discontiguous(supportsProtocol/2).
:- discontiguous(target/2).
:- discontiguous(topDataProperty/2).
:- discontiguous(label/2).
:- discontiguous(comment/2).
% annotationProperty('http://www.w3.org/2000/01/rdf-schema#comment') 
% annotationProperty('http://www.w3.org/2000/01/rdf-schema#label') 
% class('http://org.semanticweb.owlapi/error#Error1') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Application') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#BGP') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#BackendFunction') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ClusterTemplate') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Component') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ComputeLimits') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ComputeUsage') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Container') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#DHCP') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#DNS') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#DatabaseFunction') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#DeploymentUnit') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Device') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Electricity') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ExecutionEnvironment') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#FTP') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#FirewallFunction') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Flavor') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#FlavorAccess') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#FloatingIP') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Function') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#HTTP') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#HTTPS') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#HubFunction') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Hypervisor') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ICMP') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ICMPv6') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IGMP') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IMAP') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IP') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IPNetwork') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IPOIB') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IPSec') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IPVLAN') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IPVTAP') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IPv4') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IPv6') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IRSenderReceiver') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Image') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Interface') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#InternalNetwork') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#KVM') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Keypair') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Kubernetes') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#LDAP') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#LXD') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#LinuxBridge') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#LoadBalanceFunction') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Location') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#MAC') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#MACVLAN') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#MACVTAP') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#MACsec') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#MagnumService') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#MiddleboxFunction') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#NLMON') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#NSD') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#NSILCM') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#NSLCM') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#NST') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#NTP') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Namespace') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Network') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Neutron') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Nova') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OCI') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ONAP') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OS') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OSM') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OSPF') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OpenVSwitch') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Openstack') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OpenstackTerm') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Orchestrator') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OsmTerm') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OverlayNetwork') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PDU') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#POP') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PPP') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PTP') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Package') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PhysicalDevice') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PhysicalHub') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PhysicalMachine') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PhysicalNetwork') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PhysicalRouter') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PhysicalSwitch') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Protocol') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#RTSP') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#RouteFunction') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#SMTP') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#SNMP') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#SSH') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#SecurityGroup') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#SecurityGroupRule') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Server') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ServerUsage') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Service') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ServiceFunctionChain') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Stack') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#SwitchFunction') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#TCP') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#TLS/SSL') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Terms') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Transmission') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#UDP') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Unikernel') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VCAN') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VDU') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VDUR') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VETH') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VLAN') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VNF') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VNFD') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VNFLCM') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VNFR') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VXCAN') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualDevice') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualEnvironment') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualMachine') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualNetwork') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualNetworkInterface') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Volume') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VolumeType') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VolumeTypeAccess') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VxLAN') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Wire') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#WiredNetwork') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#WiredNetworkInterface') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#WirelessNetwork') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#WirelessNetworkInterface') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Xen') 
% class('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#executionState') 
% dataProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#compute') 
% dataProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#executionState') 
% dataProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#interfaceProperty') 
% dataProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ipAddress') 
% dataProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#macAddress') 
% dataProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#network') 
% dataProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#role') 
% dataProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#spread') 
% disjointClasses(['http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#BGP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#DHCP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#DNS','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#FTP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#HTTP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#HTTPS','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ICMP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IGMP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IMAP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IPSec','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#LDAP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#MAC','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#NTP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OSPF','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#POP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PPP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PTP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#RTSP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#SMTP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#SNMP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#SSH','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#TCP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#UDP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#TLS/SSL']) 
'owl:Nothing'(X):-
     'BGP'(X),'DHCP'(X).
'owl:Nothing'(X):-
     'BGP'(X),'DNS'(X).
'owl:Nothing'(X):-
     'BGP'(X),'FTP'(X).
'owl:Nothing'(X):-
     'BGP'(X),'HTTP'(X).
'owl:Nothing'(X):-
     'BGP'(X),'HTTPS'(X).
'owl:Nothing'(X):-
     'BGP'(X),'ICMP'(X).
'owl:Nothing'(X):-
     'BGP'(X),'IGMP'(X).
'owl:Nothing'(X):-
     'BGP'(X),'IMAP'(X).
'owl:Nothing'(X):-
     'BGP'(X),'IP'(X).
'owl:Nothing'(X):-
     'BGP'(X),'IPSec'(X).
'owl:Nothing'(X):-
     'BGP'(X),'LDAP'(X).
'owl:Nothing'(X):-
     'BGP'(X),'MAC'(X).
'owl:Nothing'(X):-
     'BGP'(X),'NTP'(X).
'owl:Nothing'(X):-
     'BGP'(X),'OSPF'(X).
'owl:Nothing'(X):-
     'BGP'(X),'POP'(X).
'owl:Nothing'(X):-
     'BGP'(X),'PPP'(X).
'owl:Nothing'(X):-
     'BGP'(X),'PTP'(X).
'owl:Nothing'(X):-
     'BGP'(X),'RTSP'(X).
'owl:Nothing'(X):-
     'BGP'(X),'SMTP'(X).
'owl:Nothing'(X):-
     'BGP'(X),'SNMP'(X).
'owl:Nothing'(X):-
     'BGP'(X),'SSH'(X).
'owl:Nothing'(X):-
     'BGP'(X),'TCP'(X).
'owl:Nothing'(X):-
     'BGP'(X),'UDP'(X).
'owl:Nothing'(X):-
     'BGP'(X),'TLS/SSL'(X).
'owl:Nothing'(X):-
     'DHCP'(X),'DNS'(X).
'owl:Nothing'(X):-
     'DHCP'(X),'FTP'(X).
'owl:Nothing'(X):-
     'DHCP'(X),'HTTP'(X).
'owl:Nothing'(X):-
     'DHCP'(X),'HTTPS'(X).
'owl:Nothing'(X):-
     'DHCP'(X),'ICMP'(X).
'owl:Nothing'(X):-
     'DHCP'(X),'IGMP'(X).
'owl:Nothing'(X):-
     'DHCP'(X),'IMAP'(X).
'owl:Nothing'(X):-
     'DHCP'(X),'IP'(X).
'owl:Nothing'(X):-
     'DHCP'(X),'IPSec'(X).
'owl:Nothing'(X):-
     'DHCP'(X),'LDAP'(X).
'owl:Nothing'(X):-
     'DHCP'(X),'MAC'(X).
'owl:Nothing'(X):-
     'DHCP'(X),'NTP'(X).
'owl:Nothing'(X):-
     'DHCP'(X),'OSPF'(X).
'owl:Nothing'(X):-
     'DHCP'(X),'POP'(X).
'owl:Nothing'(X):-
     'DHCP'(X),'PPP'(X).
'owl:Nothing'(X):-
     'DHCP'(X),'PTP'(X).
'owl:Nothing'(X):-
     'DHCP'(X),'RTSP'(X).
'owl:Nothing'(X):-
     'DHCP'(X),'SMTP'(X).
'owl:Nothing'(X):-
     'DHCP'(X),'SNMP'(X).
'owl:Nothing'(X):-
     'DHCP'(X),'SSH'(X).
'owl:Nothing'(X):-
     'DHCP'(X),'TCP'(X).
'owl:Nothing'(X):-
     'DHCP'(X),'UDP'(X).
'owl:Nothing'(X):-
     'DHCP'(X),'TLS/SSL'(X).
'owl:Nothing'(X):-
     'DNS'(X),'FTP'(X).
'owl:Nothing'(X):-
     'DNS'(X),'HTTP'(X).
'owl:Nothing'(X):-
     'DNS'(X),'HTTPS'(X).
'owl:Nothing'(X):-
     'DNS'(X),'ICMP'(X).
'owl:Nothing'(X):-
     'DNS'(X),'IGMP'(X).
'owl:Nothing'(X):-
     'DNS'(X),'IMAP'(X).
'owl:Nothing'(X):-
     'DNS'(X),'IP'(X).
'owl:Nothing'(X):-
     'DNS'(X),'IPSec'(X).
'owl:Nothing'(X):-
     'DNS'(X),'LDAP'(X).
'owl:Nothing'(X):-
     'DNS'(X),'MAC'(X).
'owl:Nothing'(X):-
     'DNS'(X),'NTP'(X).
'owl:Nothing'(X):-
     'DNS'(X),'OSPF'(X).
'owl:Nothing'(X):-
     'DNS'(X),'POP'(X).
'owl:Nothing'(X):-
     'DNS'(X),'PPP'(X).
'owl:Nothing'(X):-
     'DNS'(X),'PTP'(X).
'owl:Nothing'(X):-
     'DNS'(X),'RTSP'(X).
'owl:Nothing'(X):-
     'DNS'(X),'SMTP'(X).
'owl:Nothing'(X):-
     'DNS'(X),'SNMP'(X).
'owl:Nothing'(X):-
     'DNS'(X),'SSH'(X).
'owl:Nothing'(X):-
     'DNS'(X),'TCP'(X).
'owl:Nothing'(X):-
     'DNS'(X),'UDP'(X).
'owl:Nothing'(X):-
     'DNS'(X),'TLS/SSL'(X).
'owl:Nothing'(X):-
     'FTP'(X),'HTTP'(X).
'owl:Nothing'(X):-
     'FTP'(X),'HTTPS'(X).
'owl:Nothing'(X):-
     'FTP'(X),'ICMP'(X).
'owl:Nothing'(X):-
     'FTP'(X),'IGMP'(X).
'owl:Nothing'(X):-
     'FTP'(X),'IMAP'(X).
'owl:Nothing'(X):-
     'FTP'(X),'IP'(X).
'owl:Nothing'(X):-
     'FTP'(X),'IPSec'(X).
'owl:Nothing'(X):-
     'FTP'(X),'LDAP'(X).
'owl:Nothing'(X):-
     'FTP'(X),'MAC'(X).
'owl:Nothing'(X):-
     'FTP'(X),'NTP'(X).
'owl:Nothing'(X):-
     'FTP'(X),'OSPF'(X).
'owl:Nothing'(X):-
     'FTP'(X),'POP'(X).
'owl:Nothing'(X):-
     'FTP'(X),'PPP'(X).
'owl:Nothing'(X):-
     'FTP'(X),'PTP'(X).
'owl:Nothing'(X):-
     'FTP'(X),'RTSP'(X).
'owl:Nothing'(X):-
     'FTP'(X),'SMTP'(X).
'owl:Nothing'(X):-
     'FTP'(X),'SNMP'(X).
'owl:Nothing'(X):-
     'FTP'(X),'SSH'(X).
'owl:Nothing'(X):-
     'FTP'(X),'TCP'(X).
'owl:Nothing'(X):-
     'FTP'(X),'UDP'(X).
'owl:Nothing'(X):-
     'FTP'(X),'TLS/SSL'(X).
'owl:Nothing'(X):-
     'HTTP'(X),'HTTPS'(X).
'owl:Nothing'(X):-
     'HTTP'(X),'ICMP'(X).
'owl:Nothing'(X):-
     'HTTP'(X),'IGMP'(X).
'owl:Nothing'(X):-
     'HTTP'(X),'IMAP'(X).
'owl:Nothing'(X):-
     'HTTP'(X),'IP'(X).
'owl:Nothing'(X):-
     'HTTP'(X),'IPSec'(X).
'owl:Nothing'(X):-
     'HTTP'(X),'LDAP'(X).
'owl:Nothing'(X):-
     'HTTP'(X),'MAC'(X).
'owl:Nothing'(X):-
     'HTTP'(X),'NTP'(X).
'owl:Nothing'(X):-
     'HTTP'(X),'OSPF'(X).
'owl:Nothing'(X):-
     'HTTP'(X),'POP'(X).
'owl:Nothing'(X):-
     'HTTP'(X),'PPP'(X).
'owl:Nothing'(X):-
     'HTTP'(X),'PTP'(X).
'owl:Nothing'(X):-
     'HTTP'(X),'RTSP'(X).
'owl:Nothing'(X):-
     'HTTP'(X),'SMTP'(X).
'owl:Nothing'(X):-
     'HTTP'(X),'SNMP'(X).
'owl:Nothing'(X):-
     'HTTP'(X),'SSH'(X).
'owl:Nothing'(X):-
     'HTTP'(X),'TCP'(X).
'owl:Nothing'(X):-
     'HTTP'(X),'UDP'(X).
'owl:Nothing'(X):-
     'HTTP'(X),'TLS/SSL'(X).
'owl:Nothing'(X):-
     'HTTPS'(X),'ICMP'(X).
'owl:Nothing'(X):-
     'HTTPS'(X),'IGMP'(X).
'owl:Nothing'(X):-
     'HTTPS'(X),'IMAP'(X).
'owl:Nothing'(X):-
     'HTTPS'(X),'IP'(X).
'owl:Nothing'(X):-
     'HTTPS'(X),'IPSec'(X).
'owl:Nothing'(X):-
     'HTTPS'(X),'LDAP'(X).
'owl:Nothing'(X):-
     'HTTPS'(X),'MAC'(X).
'owl:Nothing'(X):-
     'HTTPS'(X),'NTP'(X).
'owl:Nothing'(X):-
     'HTTPS'(X),'OSPF'(X).
'owl:Nothing'(X):-
     'HTTPS'(X),'POP'(X).
'owl:Nothing'(X):-
     'HTTPS'(X),'PPP'(X).
'owl:Nothing'(X):-
     'HTTPS'(X),'PTP'(X).
'owl:Nothing'(X):-
     'HTTPS'(X),'RTSP'(X).
'owl:Nothing'(X):-
     'HTTPS'(X),'SMTP'(X).
'owl:Nothing'(X):-
     'HTTPS'(X),'SNMP'(X).
'owl:Nothing'(X):-
     'HTTPS'(X),'SSH'(X).
'owl:Nothing'(X):-
     'HTTPS'(X),'TCP'(X).
'owl:Nothing'(X):-
     'HTTPS'(X),'UDP'(X).
'owl:Nothing'(X):-
     'HTTPS'(X),'TLS/SSL'(X).
'owl:Nothing'(X):-
     'ICMP'(X),'IGMP'(X).
'owl:Nothing'(X):-
     'ICMP'(X),'IMAP'(X).
'owl:Nothing'(X):-
     'ICMP'(X),'IP'(X).
'owl:Nothing'(X):-
     'ICMP'(X),'IPSec'(X).
'owl:Nothing'(X):-
     'ICMP'(X),'LDAP'(X).
'owl:Nothing'(X):-
     'ICMP'(X),'MAC'(X).
'owl:Nothing'(X):-
     'ICMP'(X),'NTP'(X).
'owl:Nothing'(X):-
     'ICMP'(X),'OSPF'(X).
'owl:Nothing'(X):-
     'ICMP'(X),'POP'(X).
'owl:Nothing'(X):-
     'ICMP'(X),'PPP'(X).
'owl:Nothing'(X):-
     'ICMP'(X),'PTP'(X).
'owl:Nothing'(X):-
     'ICMP'(X),'RTSP'(X).
'owl:Nothing'(X):-
     'ICMP'(X),'SMTP'(X).
'owl:Nothing'(X):-
     'ICMP'(X),'SNMP'(X).
'owl:Nothing'(X):-
     'ICMP'(X),'SSH'(X).
'owl:Nothing'(X):-
     'ICMP'(X),'TCP'(X).
'owl:Nothing'(X):-
     'ICMP'(X),'UDP'(X).
'owl:Nothing'(X):-
     'ICMP'(X),'TLS/SSL'(X).
'owl:Nothing'(X):-
     'IGMP'(X),'IMAP'(X).
'owl:Nothing'(X):-
     'IGMP'(X),'IP'(X).
'owl:Nothing'(X):-
     'IGMP'(X),'IPSec'(X).
'owl:Nothing'(X):-
     'IGMP'(X),'LDAP'(X).
'owl:Nothing'(X):-
     'IGMP'(X),'MAC'(X).
'owl:Nothing'(X):-
     'IGMP'(X),'NTP'(X).
'owl:Nothing'(X):-
     'IGMP'(X),'OSPF'(X).
'owl:Nothing'(X):-
     'IGMP'(X),'POP'(X).
'owl:Nothing'(X):-
     'IGMP'(X),'PPP'(X).
'owl:Nothing'(X):-
     'IGMP'(X),'PTP'(X).
'owl:Nothing'(X):-
     'IGMP'(X),'RTSP'(X).
'owl:Nothing'(X):-
     'IGMP'(X),'SMTP'(X).
'owl:Nothing'(X):-
     'IGMP'(X),'SNMP'(X).
'owl:Nothing'(X):-
     'IGMP'(X),'SSH'(X).
'owl:Nothing'(X):-
     'IGMP'(X),'TCP'(X).
'owl:Nothing'(X):-
     'IGMP'(X),'UDP'(X).
'owl:Nothing'(X):-
     'IGMP'(X),'TLS/SSL'(X).
'owl:Nothing'(X):-
     'IMAP'(X),'IP'(X).
'owl:Nothing'(X):-
     'IMAP'(X),'IPSec'(X).
'owl:Nothing'(X):-
     'IMAP'(X),'LDAP'(X).
'owl:Nothing'(X):-
     'IMAP'(X),'MAC'(X).
'owl:Nothing'(X):-
     'IMAP'(X),'NTP'(X).
'owl:Nothing'(X):-
     'IMAP'(X),'OSPF'(X).
'owl:Nothing'(X):-
     'IMAP'(X),'POP'(X).
'owl:Nothing'(X):-
     'IMAP'(X),'PPP'(X).
'owl:Nothing'(X):-
     'IMAP'(X),'PTP'(X).
'owl:Nothing'(X):-
     'IMAP'(X),'RTSP'(X).
'owl:Nothing'(X):-
     'IMAP'(X),'SMTP'(X).
'owl:Nothing'(X):-
     'IMAP'(X),'SNMP'(X).
'owl:Nothing'(X):-
     'IMAP'(X),'SSH'(X).
'owl:Nothing'(X):-
     'IMAP'(X),'TCP'(X).
'owl:Nothing'(X):-
     'IMAP'(X),'UDP'(X).
'owl:Nothing'(X):-
     'IMAP'(X),'TLS/SSL'(X).
'owl:Nothing'(X):-
     'IP'(X),'IPSec'(X).
'owl:Nothing'(X):-
     'IP'(X),'LDAP'(X).
'owl:Nothing'(X):-
     'IP'(X),'MAC'(X).
'owl:Nothing'(X):-
     'IP'(X),'NTP'(X).
'owl:Nothing'(X):-
     'IP'(X),'OSPF'(X).
'owl:Nothing'(X):-
     'IP'(X),'POP'(X).
'owl:Nothing'(X):-
     'IP'(X),'PPP'(X).
'owl:Nothing'(X):-
     'IP'(X),'PTP'(X).
'owl:Nothing'(X):-
     'IP'(X),'RTSP'(X).
'owl:Nothing'(X):-
     'IP'(X),'SMTP'(X).
'owl:Nothing'(X):-
     'IP'(X),'SNMP'(X).
'owl:Nothing'(X):-
     'IP'(X),'SSH'(X).
'owl:Nothing'(X):-
     'IP'(X),'TCP'(X).
'owl:Nothing'(X):-
     'IP'(X),'UDP'(X).
'owl:Nothing'(X):-
     'IP'(X),'TLS/SSL'(X).
'owl:Nothing'(X):-
     'IPSec'(X),'LDAP'(X).
'owl:Nothing'(X):-
     'IPSec'(X),'MAC'(X).
'owl:Nothing'(X):-
     'IPSec'(X),'NTP'(X).
'owl:Nothing'(X):-
     'IPSec'(X),'OSPF'(X).
'owl:Nothing'(X):-
     'IPSec'(X),'POP'(X).
'owl:Nothing'(X):-
     'IPSec'(X),'PPP'(X).
'owl:Nothing'(X):-
     'IPSec'(X),'PTP'(X).
'owl:Nothing'(X):-
     'IPSec'(X),'RTSP'(X).
'owl:Nothing'(X):-
     'IPSec'(X),'SMTP'(X).
'owl:Nothing'(X):-
     'IPSec'(X),'SNMP'(X).
'owl:Nothing'(X):-
     'IPSec'(X),'SSH'(X).
'owl:Nothing'(X):-
     'IPSec'(X),'TCP'(X).
'owl:Nothing'(X):-
     'IPSec'(X),'UDP'(X).
'owl:Nothing'(X):-
     'IPSec'(X),'TLS/SSL'(X).
'owl:Nothing'(X):-
     'LDAP'(X),'MAC'(X).
'owl:Nothing'(X):-
     'LDAP'(X),'NTP'(X).
'owl:Nothing'(X):-
     'LDAP'(X),'OSPF'(X).
'owl:Nothing'(X):-
     'LDAP'(X),'POP'(X).
'owl:Nothing'(X):-
     'LDAP'(X),'PPP'(X).
'owl:Nothing'(X):-
     'LDAP'(X),'PTP'(X).
'owl:Nothing'(X):-
     'LDAP'(X),'RTSP'(X).
'owl:Nothing'(X):-
     'LDAP'(X),'SMTP'(X).
'owl:Nothing'(X):-
     'LDAP'(X),'SNMP'(X).
'owl:Nothing'(X):-
     'LDAP'(X),'SSH'(X).
'owl:Nothing'(X):-
     'LDAP'(X),'TCP'(X).
'owl:Nothing'(X):-
     'LDAP'(X),'UDP'(X).
'owl:Nothing'(X):-
     'LDAP'(X),'TLS/SSL'(X).
'owl:Nothing'(X):-
     'MAC'(X),'NTP'(X).
'owl:Nothing'(X):-
     'MAC'(X),'OSPF'(X).
'owl:Nothing'(X):-
     'MAC'(X),'POP'(X).
'owl:Nothing'(X):-
     'MAC'(X),'PPP'(X).
'owl:Nothing'(X):-
     'MAC'(X),'PTP'(X).
'owl:Nothing'(X):-
     'MAC'(X),'RTSP'(X).
'owl:Nothing'(X):-
     'MAC'(X),'SMTP'(X).
'owl:Nothing'(X):-
     'MAC'(X),'SNMP'(X).
'owl:Nothing'(X):-
     'MAC'(X),'SSH'(X).
'owl:Nothing'(X):-
     'MAC'(X),'TCP'(X).
'owl:Nothing'(X):-
     'MAC'(X),'UDP'(X).
'owl:Nothing'(X):-
     'MAC'(X),'TLS/SSL'(X).
'owl:Nothing'(X):-
     'NTP'(X),'OSPF'(X).
'owl:Nothing'(X):-
     'NTP'(X),'POP'(X).
'owl:Nothing'(X):-
     'NTP'(X),'PPP'(X).
'owl:Nothing'(X):-
     'NTP'(X),'PTP'(X).
'owl:Nothing'(X):-
     'NTP'(X),'RTSP'(X).
'owl:Nothing'(X):-
     'NTP'(X),'SMTP'(X).
'owl:Nothing'(X):-
     'NTP'(X),'SNMP'(X).
'owl:Nothing'(X):-
     'NTP'(X),'SSH'(X).
'owl:Nothing'(X):-
     'NTP'(X),'TCP'(X).
'owl:Nothing'(X):-
     'NTP'(X),'UDP'(X).
'owl:Nothing'(X):-
     'NTP'(X),'TLS/SSL'(X).
'owl:Nothing'(X):-
     'OSPF'(X),'POP'(X).
'owl:Nothing'(X):-
     'OSPF'(X),'PPP'(X).
'owl:Nothing'(X):-
     'OSPF'(X),'PTP'(X).
'owl:Nothing'(X):-
     'OSPF'(X),'RTSP'(X).
'owl:Nothing'(X):-
     'OSPF'(X),'SMTP'(X).
'owl:Nothing'(X):-
     'OSPF'(X),'SNMP'(X).
'owl:Nothing'(X):-
     'OSPF'(X),'SSH'(X).
'owl:Nothing'(X):-
     'OSPF'(X),'TCP'(X).
'owl:Nothing'(X):-
     'OSPF'(X),'UDP'(X).
'owl:Nothing'(X):-
     'OSPF'(X),'TLS/SSL'(X).
'owl:Nothing'(X):-
     'POP'(X),'PPP'(X).
'owl:Nothing'(X):-
     'POP'(X),'PTP'(X).
'owl:Nothing'(X):-
     'POP'(X),'RTSP'(X).
'owl:Nothing'(X):-
     'POP'(X),'SMTP'(X).
'owl:Nothing'(X):-
     'POP'(X),'SNMP'(X).
'owl:Nothing'(X):-
     'POP'(X),'SSH'(X).
'owl:Nothing'(X):-
     'POP'(X),'TCP'(X).
'owl:Nothing'(X):-
     'POP'(X),'UDP'(X).
'owl:Nothing'(X):-
     'POP'(X),'TLS/SSL'(X).
'owl:Nothing'(X):-
     'PPP'(X),'PTP'(X).
'owl:Nothing'(X):-
     'PPP'(X),'RTSP'(X).
'owl:Nothing'(X):-
     'PPP'(X),'SMTP'(X).
'owl:Nothing'(X):-
     'PPP'(X),'SNMP'(X).
'owl:Nothing'(X):-
     'PPP'(X),'SSH'(X).
'owl:Nothing'(X):-
     'PPP'(X),'TCP'(X).
'owl:Nothing'(X):-
     'PPP'(X),'UDP'(X).
'owl:Nothing'(X):-
     'PPP'(X),'TLS/SSL'(X).
'owl:Nothing'(X):-
     'PTP'(X),'RTSP'(X).
'owl:Nothing'(X):-
     'PTP'(X),'SMTP'(X).
'owl:Nothing'(X):-
     'PTP'(X),'SNMP'(X).
'owl:Nothing'(X):-
     'PTP'(X),'SSH'(X).
'owl:Nothing'(X):-
     'PTP'(X),'TCP'(X).
'owl:Nothing'(X):-
     'PTP'(X),'UDP'(X).
'owl:Nothing'(X):-
     'PTP'(X),'TLS/SSL'(X).
'owl:Nothing'(X):-
     'RTSP'(X),'SMTP'(X).
'owl:Nothing'(X):-
     'RTSP'(X),'SNMP'(X).
'owl:Nothing'(X):-
     'RTSP'(X),'SSH'(X).
'owl:Nothing'(X):-
     'RTSP'(X),'TCP'(X).
'owl:Nothing'(X):-
     'RTSP'(X),'UDP'(X).
'owl:Nothing'(X):-
     'RTSP'(X),'TLS/SSL'(X).
'owl:Nothing'(X):-
     'SMTP'(X),'SNMP'(X).
'owl:Nothing'(X):-
     'SMTP'(X),'SSH'(X).
'owl:Nothing'(X):-
     'SMTP'(X),'TCP'(X).
'owl:Nothing'(X):-
     'SMTP'(X),'UDP'(X).
'owl:Nothing'(X):-
     'SMTP'(X),'TLS/SSL'(X).
'owl:Nothing'(X):-
     'SNMP'(X),'SSH'(X).
'owl:Nothing'(X):-
     'SNMP'(X),'TCP'(X).
'owl:Nothing'(X):-
     'SNMP'(X),'UDP'(X).
'owl:Nothing'(X):-
     'SNMP'(X),'TLS/SSL'(X).
'owl:Nothing'(X):-
     'SSH'(X),'TCP'(X).
'owl:Nothing'(X):-
     'SSH'(X),'UDP'(X).
'owl:Nothing'(X):-
     'SSH'(X),'TLS/SSL'(X).
'owl:Nothing'(X):-
     'TCP'(X),'UDP'(X).
'owl:Nothing'(X):-
     'TCP'(X),'TLS/SSL'(X).
'owl:Nothing'(X):-
     'TLS/SSL'(X),'UDP'(X).
% disjointClasses(['http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ClusterTemplate','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ComputeLimits','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ComputeUsage','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Flavor','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#FlavorAccess','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#FloatingIP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Image','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Keypair','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Location','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#MagnumService','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#SecurityGroup','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#SecurityGroupRule','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Server','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ServerUsage','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Stack','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Volume','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VolumeType','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VolumeTypeAccess']) 
'owl:Nothing'(X):-
     'ClusterTemplate'(X),'ComputeLimits'(X).
'owl:Nothing'(X):-
     'ClusterTemplate'(X),'ComputeUsage'(X).
'owl:Nothing'(X):-
     'ClusterTemplate'(X),'Flavor'(X).
'owl:Nothing'(X):-
     'ClusterTemplate'(X),'FlavorAccess'(X).
'owl:Nothing'(X):-
     'ClusterTemplate'(X),'FloatingIP'(X).
'owl:Nothing'(X):-
     'ClusterTemplate'(X),'Image'(X).
'owl:Nothing'(X):-
     'ClusterTemplate'(X),'Keypair'(X).
'owl:Nothing'(X):-
     'ClusterTemplate'(X),'Location'(X).
'owl:Nothing'(X):-
     'ClusterTemplate'(X),'MagnumService'(X).
'owl:Nothing'(X):-
     'ClusterTemplate'(X),'SecurityGroup'(X).
'owl:Nothing'(X):-
     'ClusterTemplate'(X),'SecurityGroupRule'(X).
'owl:Nothing'(X):-
     'ClusterTemplate'(X),'Server'(X).
'owl:Nothing'(X):-
     'ClusterTemplate'(X),'ServerUsage'(X).
'owl:Nothing'(X):-
     'ClusterTemplate'(X),'Stack'(X).
'owl:Nothing'(X):-
     'ClusterTemplate'(X),'Volume'(X).
'owl:Nothing'(X):-
     'ClusterTemplate'(X),'VolumeType'(X).
'owl:Nothing'(X):-
     'ClusterTemplate'(X),'VolumeTypeAccess'(X).
'owl:Nothing'(X):-
     'ComputeLimits'(X),'ComputeUsage'(X).
'owl:Nothing'(X):-
     'ComputeLimits'(X),'Flavor'(X).
'owl:Nothing'(X):-
     'ComputeLimits'(X),'FlavorAccess'(X).
'owl:Nothing'(X):-
     'ComputeLimits'(X),'FloatingIP'(X).
'owl:Nothing'(X):-
     'ComputeLimits'(X),'Image'(X).
'owl:Nothing'(X):-
     'ComputeLimits'(X),'Keypair'(X).
'owl:Nothing'(X):-
     'ComputeLimits'(X),'Location'(X).
'owl:Nothing'(X):-
     'ComputeLimits'(X),'MagnumService'(X).
'owl:Nothing'(X):-
     'ComputeLimits'(X),'SecurityGroup'(X).
'owl:Nothing'(X):-
     'ComputeLimits'(X),'SecurityGroupRule'(X).
'owl:Nothing'(X):-
     'ComputeLimits'(X),'Server'(X).
'owl:Nothing'(X):-
     'ComputeLimits'(X),'ServerUsage'(X).
'owl:Nothing'(X):-
     'ComputeLimits'(X),'Stack'(X).
'owl:Nothing'(X):-
     'ComputeLimits'(X),'Volume'(X).
'owl:Nothing'(X):-
     'ComputeLimits'(X),'VolumeType'(X).
'owl:Nothing'(X):-
     'ComputeLimits'(X),'VolumeTypeAccess'(X).
'owl:Nothing'(X):-
     'ComputeUsage'(X),'Flavor'(X).
'owl:Nothing'(X):-
     'ComputeUsage'(X),'FlavorAccess'(X).
'owl:Nothing'(X):-
     'ComputeUsage'(X),'FloatingIP'(X).
'owl:Nothing'(X):-
     'ComputeUsage'(X),'Image'(X).
'owl:Nothing'(X):-
     'ComputeUsage'(X),'Keypair'(X).
'owl:Nothing'(X):-
     'ComputeUsage'(X),'Location'(X).
'owl:Nothing'(X):-
     'ComputeUsage'(X),'MagnumService'(X).
'owl:Nothing'(X):-
     'ComputeUsage'(X),'SecurityGroup'(X).
'owl:Nothing'(X):-
     'ComputeUsage'(X),'SecurityGroupRule'(X).
'owl:Nothing'(X):-
     'ComputeUsage'(X),'Server'(X).
'owl:Nothing'(X):-
     'ComputeUsage'(X),'ServerUsage'(X).
'owl:Nothing'(X):-
     'ComputeUsage'(X),'Stack'(X).
'owl:Nothing'(X):-
     'ComputeUsage'(X),'Volume'(X).
'owl:Nothing'(X):-
     'ComputeUsage'(X),'VolumeType'(X).
'owl:Nothing'(X):-
     'ComputeUsage'(X),'VolumeTypeAccess'(X).
'owl:Nothing'(X):-
     'Flavor'(X),'FlavorAccess'(X).
'owl:Nothing'(X):-
     'Flavor'(X),'FloatingIP'(X).
'owl:Nothing'(X):-
     'Flavor'(X),'Image'(X).
'owl:Nothing'(X):-
     'Flavor'(X),'Keypair'(X).
'owl:Nothing'(X):-
     'Flavor'(X),'Location'(X).
'owl:Nothing'(X):-
     'Flavor'(X),'MagnumService'(X).
'owl:Nothing'(X):-
     'Flavor'(X),'SecurityGroup'(X).
'owl:Nothing'(X):-
     'Flavor'(X),'SecurityGroupRule'(X).
'owl:Nothing'(X):-
     'Flavor'(X),'Server'(X).
'owl:Nothing'(X):-
     'Flavor'(X),'ServerUsage'(X).
'owl:Nothing'(X):-
     'Flavor'(X),'Stack'(X).
'owl:Nothing'(X):-
     'Flavor'(X),'Volume'(X).
'owl:Nothing'(X):-
     'Flavor'(X),'VolumeType'(X).
'owl:Nothing'(X):-
     'Flavor'(X),'VolumeTypeAccess'(X).
'owl:Nothing'(X):-
     'FlavorAccess'(X),'FloatingIP'(X).
'owl:Nothing'(X):-
     'FlavorAccess'(X),'Image'(X).
'owl:Nothing'(X):-
     'FlavorAccess'(X),'Keypair'(X).
'owl:Nothing'(X):-
     'FlavorAccess'(X),'Location'(X).
'owl:Nothing'(X):-
     'FlavorAccess'(X),'MagnumService'(X).
'owl:Nothing'(X):-
     'FlavorAccess'(X),'SecurityGroup'(X).
'owl:Nothing'(X):-
     'FlavorAccess'(X),'SecurityGroupRule'(X).
'owl:Nothing'(X):-
     'FlavorAccess'(X),'Server'(X).
'owl:Nothing'(X):-
     'FlavorAccess'(X),'ServerUsage'(X).
'owl:Nothing'(X):-
     'FlavorAccess'(X),'Stack'(X).
'owl:Nothing'(X):-
     'FlavorAccess'(X),'Volume'(X).
'owl:Nothing'(X):-
     'FlavorAccess'(X),'VolumeType'(X).
'owl:Nothing'(X):-
     'FlavorAccess'(X),'VolumeTypeAccess'(X).
'owl:Nothing'(X):-
     'FloatingIP'(X),'Image'(X).
'owl:Nothing'(X):-
     'FloatingIP'(X),'Keypair'(X).
'owl:Nothing'(X):-
     'FloatingIP'(X),'Location'(X).
'owl:Nothing'(X):-
     'FloatingIP'(X),'MagnumService'(X).
'owl:Nothing'(X):-
     'FloatingIP'(X),'SecurityGroup'(X).
'owl:Nothing'(X):-
     'FloatingIP'(X),'SecurityGroupRule'(X).
'owl:Nothing'(X):-
     'FloatingIP'(X),'Server'(X).
'owl:Nothing'(X):-
     'FloatingIP'(X),'ServerUsage'(X).
'owl:Nothing'(X):-
     'FloatingIP'(X),'Stack'(X).
'owl:Nothing'(X):-
     'FloatingIP'(X),'Volume'(X).
'owl:Nothing'(X):-
     'FloatingIP'(X),'VolumeType'(X).
'owl:Nothing'(X):-
     'FloatingIP'(X),'VolumeTypeAccess'(X).
'owl:Nothing'(X):-
     'Image'(X),'Keypair'(X).
'owl:Nothing'(X):-
     'Image'(X),'Location'(X).
'owl:Nothing'(X):-
     'Image'(X),'MagnumService'(X).
'owl:Nothing'(X):-
     'Image'(X),'SecurityGroup'(X).
'owl:Nothing'(X):-
     'Image'(X),'SecurityGroupRule'(X).
'owl:Nothing'(X):-
     'Image'(X),'Server'(X).
'owl:Nothing'(X):-
     'Image'(X),'ServerUsage'(X).
'owl:Nothing'(X):-
     'Image'(X),'Stack'(X).
'owl:Nothing'(X):-
     'Image'(X),'Volume'(X).
'owl:Nothing'(X):-
     'Image'(X),'VolumeType'(X).
'owl:Nothing'(X):-
     'Image'(X),'VolumeTypeAccess'(X).
'owl:Nothing'(X):-
     'Keypair'(X),'Location'(X).
'owl:Nothing'(X):-
     'Keypair'(X),'MagnumService'(X).
'owl:Nothing'(X):-
     'Keypair'(X),'SecurityGroup'(X).
'owl:Nothing'(X):-
     'Keypair'(X),'SecurityGroupRule'(X).
'owl:Nothing'(X):-
     'Keypair'(X),'Server'(X).
'owl:Nothing'(X):-
     'Keypair'(X),'ServerUsage'(X).
'owl:Nothing'(X):-
     'Keypair'(X),'Stack'(X).
'owl:Nothing'(X):-
     'Keypair'(X),'Volume'(X).
'owl:Nothing'(X):-
     'Keypair'(X),'VolumeType'(X).
'owl:Nothing'(X):-
     'Keypair'(X),'VolumeTypeAccess'(X).
'owl:Nothing'(X):-
     'Location'(X),'MagnumService'(X).
'owl:Nothing'(X):-
     'Location'(X),'SecurityGroup'(X).
'owl:Nothing'(X):-
     'Location'(X),'SecurityGroupRule'(X).
'owl:Nothing'(X):-
     'Location'(X),'Server'(X).
'owl:Nothing'(X):-
     'Location'(X),'ServerUsage'(X).
'owl:Nothing'(X):-
     'Location'(X),'Stack'(X).
'owl:Nothing'(X):-
     'Location'(X),'Volume'(X).
'owl:Nothing'(X):-
     'Location'(X),'VolumeType'(X).
'owl:Nothing'(X):-
     'Location'(X),'VolumeTypeAccess'(X).
'owl:Nothing'(X):-
     'MagnumService'(X),'SecurityGroup'(X).
'owl:Nothing'(X):-
     'MagnumService'(X),'SecurityGroupRule'(X).
'owl:Nothing'(X):-
     'MagnumService'(X),'Server'(X).
'owl:Nothing'(X):-
     'MagnumService'(X),'ServerUsage'(X).
'owl:Nothing'(X):-
     'MagnumService'(X),'Stack'(X).
'owl:Nothing'(X):-
     'MagnumService'(X),'Volume'(X).
'owl:Nothing'(X):-
     'MagnumService'(X),'VolumeType'(X).
'owl:Nothing'(X):-
     'MagnumService'(X),'VolumeTypeAccess'(X).
'owl:Nothing'(X):-
     'SecurityGroup'(X),'SecurityGroupRule'(X).
'owl:Nothing'(X):-
     'SecurityGroup'(X),'Server'(X).
'owl:Nothing'(X):-
     'SecurityGroup'(X),'ServerUsage'(X).
'owl:Nothing'(X):-
     'SecurityGroup'(X),'Stack'(X).
'owl:Nothing'(X):-
     'SecurityGroup'(X),'Volume'(X).
'owl:Nothing'(X):-
     'SecurityGroup'(X),'VolumeType'(X).
'owl:Nothing'(X):-
     'SecurityGroup'(X),'VolumeTypeAccess'(X).
'owl:Nothing'(X):-
     'SecurityGroupRule'(X),'Server'(X).
'owl:Nothing'(X):-
     'SecurityGroupRule'(X),'ServerUsage'(X).
'owl:Nothing'(X):-
     'SecurityGroupRule'(X),'Stack'(X).
'owl:Nothing'(X):-
     'SecurityGroupRule'(X),'Volume'(X).
'owl:Nothing'(X):-
     'SecurityGroupRule'(X),'VolumeType'(X).
'owl:Nothing'(X):-
     'SecurityGroupRule'(X),'VolumeTypeAccess'(X).
'owl:Nothing'(X):-
     'Server'(X),'ServerUsage'(X).
'owl:Nothing'(X):-
     'Server'(X),'Stack'(X).
'owl:Nothing'(X):-
     'Server'(X),'Volume'(X).
'owl:Nothing'(X):-
     'Server'(X),'VolumeType'(X).
'owl:Nothing'(X):-
     'Server'(X),'VolumeTypeAccess'(X).
'owl:Nothing'(X):-
     'ServerUsage'(X),'Stack'(X).
'owl:Nothing'(X):-
     'ServerUsage'(X),'Volume'(X).
'owl:Nothing'(X):-
     'ServerUsage'(X),'VolumeType'(X).
'owl:Nothing'(X):-
     'ServerUsage'(X),'VolumeTypeAccess'(X).
'owl:Nothing'(X):-
     'Stack'(X),'Volume'(X).
'owl:Nothing'(X):-
     'Stack'(X),'VolumeType'(X).
'owl:Nothing'(X):-
     'Stack'(X),'VolumeTypeAccess'(X).
'owl:Nothing'(X):-
     'Volume'(X),'VolumeType'(X).
'owl:Nothing'(X):-
     'Volume'(X),'VolumeTypeAccess'(X).
'owl:Nothing'(X):-
     'VolumeType'(X),'VolumeTypeAccess'(X).
% disjointClasses(['http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Container','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OS']) 
'owl:Nothing'(X):-
     'Container'(X),'OS'(X).
% disjointClasses(['http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IPOIB','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IPVLAN','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IPVTAP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#MACVLAN','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#MACVTAP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#MACsec','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#NLMON','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VCAN','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VETH','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VLAN','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VXCAN','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VxLAN']) 
'owl:Nothing'(X):-
     'IPOIB'(X),'IPVLAN'(X).
'owl:Nothing'(X):-
     'IPOIB'(X),'IPVTAP'(X).
'owl:Nothing'(X):-
     'IPOIB'(X),'MACVLAN'(X).
'owl:Nothing'(X):-
     'IPOIB'(X),'MACVTAP'(X).
'owl:Nothing'(X):-
     'IPOIB'(X),'MACsec'(X).
'owl:Nothing'(X):-
     'IPOIB'(X),'NLMON'(X).
'owl:Nothing'(X):-
     'IPOIB'(X),'VCAN'(X).
'owl:Nothing'(X):-
     'IPOIB'(X),'VETH'(X).
'owl:Nothing'(X):-
     'IPOIB'(X),'VLAN'(X).
'owl:Nothing'(X):-
     'IPOIB'(X),'VXCAN'(X).
'owl:Nothing'(X):-
     'IPOIB'(X),'VxLAN'(X).
'owl:Nothing'(X):-
     'IPVLAN'(X),'IPVTAP'(X).
'owl:Nothing'(X):-
     'IPVLAN'(X),'MACVLAN'(X).
'owl:Nothing'(X):-
     'IPVLAN'(X),'MACVTAP'(X).
'owl:Nothing'(X):-
     'IPVLAN'(X),'MACsec'(X).
'owl:Nothing'(X):-
     'IPVLAN'(X),'NLMON'(X).
'owl:Nothing'(X):-
     'IPVLAN'(X),'VCAN'(X).
'owl:Nothing'(X):-
     'IPVLAN'(X),'VETH'(X).
'owl:Nothing'(X):-
     'IPVLAN'(X),'VLAN'(X).
'owl:Nothing'(X):-
     'IPVLAN'(X),'VXCAN'(X).
'owl:Nothing'(X):-
     'IPVLAN'(X),'VxLAN'(X).
'owl:Nothing'(X):-
     'IPVTAP'(X),'MACVLAN'(X).
'owl:Nothing'(X):-
     'IPVTAP'(X),'MACVTAP'(X).
'owl:Nothing'(X):-
     'IPVTAP'(X),'MACsec'(X).
'owl:Nothing'(X):-
     'IPVTAP'(X),'NLMON'(X).
'owl:Nothing'(X):-
     'IPVTAP'(X),'VCAN'(X).
'owl:Nothing'(X):-
     'IPVTAP'(X),'VETH'(X).
'owl:Nothing'(X):-
     'IPVTAP'(X),'VLAN'(X).
'owl:Nothing'(X):-
     'IPVTAP'(X),'VXCAN'(X).
'owl:Nothing'(X):-
     'IPVTAP'(X),'VxLAN'(X).
'owl:Nothing'(X):-
     'MACVLAN'(X),'MACVTAP'(X).
'owl:Nothing'(X):-
     'MACVLAN'(X),'MACsec'(X).
'owl:Nothing'(X):-
     'MACVLAN'(X),'NLMON'(X).
'owl:Nothing'(X):-
     'MACVLAN'(X),'VCAN'(X).
'owl:Nothing'(X):-
     'MACVLAN'(X),'VETH'(X).
'owl:Nothing'(X):-
     'MACVLAN'(X),'VLAN'(X).
'owl:Nothing'(X):-
     'MACVLAN'(X),'VXCAN'(X).
'owl:Nothing'(X):-
     'MACVLAN'(X),'VxLAN'(X).
'owl:Nothing'(X):-
     'MACVTAP'(X),'MACsec'(X).
'owl:Nothing'(X):-
     'MACVTAP'(X),'NLMON'(X).
'owl:Nothing'(X):-
     'MACVTAP'(X),'VCAN'(X).
'owl:Nothing'(X):-
     'MACVTAP'(X),'VETH'(X).
'owl:Nothing'(X):-
     'MACVTAP'(X),'VLAN'(X).
'owl:Nothing'(X):-
     'MACVTAP'(X),'VXCAN'(X).
'owl:Nothing'(X):-
     'MACVTAP'(X),'VxLAN'(X).
'owl:Nothing'(X):-
     'MACsec'(X),'NLMON'(X).
'owl:Nothing'(X):-
     'MACsec'(X),'VCAN'(X).
'owl:Nothing'(X):-
     'MACsec'(X),'VETH'(X).
'owl:Nothing'(X):-
     'MACsec'(X),'VLAN'(X).
'owl:Nothing'(X):-
     'MACsec'(X),'VXCAN'(X).
'owl:Nothing'(X):-
     'MACsec'(X),'VxLAN'(X).
'owl:Nothing'(X):-
     'NLMON'(X),'VCAN'(X).
'owl:Nothing'(X):-
     'NLMON'(X),'VETH'(X).
'owl:Nothing'(X):-
     'NLMON'(X),'VLAN'(X).
'owl:Nothing'(X):-
     'NLMON'(X),'VXCAN'(X).
'owl:Nothing'(X):-
     'NLMON'(X),'VxLAN'(X).
'owl:Nothing'(X):-
     'VCAN'(X),'VETH'(X).
'owl:Nothing'(X):-
     'VCAN'(X),'VLAN'(X).
'owl:Nothing'(X):-
     'VCAN'(X),'VXCAN'(X).
'owl:Nothing'(X):-
     'VCAN'(X),'VxLAN'(X).
'owl:Nothing'(X):-
     'VETH'(X),'VLAN'(X).
'owl:Nothing'(X):-
     'VETH'(X),'VXCAN'(X).
'owl:Nothing'(X):-
     'VETH'(X),'VxLAN'(X).
'owl:Nothing'(X):-
     'VLAN'(X),'VXCAN'(X).
'owl:Nothing'(X):-
     'VLAN'(X),'VxLAN'(X).
'owl:Nothing'(X):-
     'VXCAN'(X),'VxLAN'(X).
% disjointClasses(['http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IPv4','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IPv6']) 
'owl:Nothing'(X):-
     'IPv4'(X),'IPv6'(X).
% disjointClasses(['http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Kubernetes','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ONAP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OSM','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Openstack']) 
'owl:Nothing'(X):-
     'Kubernetes'(X),'ONAP'(X).
'owl:Nothing'(X):-
     'Kubernetes'(X),'OSM'(X).
'owl:Nothing'(X):-
     'Kubernetes'(X),'Openstack'(X).
'owl:Nothing'(X):-
     'ONAP'(X),'OSM'(X).
'owl:Nothing'(X):-
     'ONAP'(X),'Openstack'(X).
'owl:Nothing'(X):-
     'OSM'(X),'Openstack'(X).
% disjointClasses(['http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#NSD','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#NSILCM','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#NSLCM','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#NST','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PDU','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VDU','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VDUR','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VNF','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VNFD','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VNFLCM','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VNFR']) 
'owl:Nothing'(X):-
     'NSD'(X),'NSILCM'(X).
'owl:Nothing'(X):-
     'NSD'(X),'NSLCM'(X).
'owl:Nothing'(X):-
     'NSD'(X),'NST'(X).
'owl:Nothing'(X):-
     'NSD'(X),'PDU'(X).
'owl:Nothing'(X):-
     'NSD'(X),'VDU'(X).
'owl:Nothing'(X):-
     'NSD'(X),'VDUR'(X).
'owl:Nothing'(X):-
     'NSD'(X),'VNF'(X).
'owl:Nothing'(X):-
     'NSD'(X),'VNFD'(X).
'owl:Nothing'(X):-
     'NSD'(X),'VNFLCM'(X).
'owl:Nothing'(X):-
     'NSD'(X),'VNFR'(X).
'owl:Nothing'(X):-
     'NSILCM'(X),'NSLCM'(X).
'owl:Nothing'(X):-
     'NSILCM'(X),'NST'(X).
'owl:Nothing'(X):-
     'NSILCM'(X),'PDU'(X).
'owl:Nothing'(X):-
     'NSILCM'(X),'VDU'(X).
'owl:Nothing'(X):-
     'NSILCM'(X),'VDUR'(X).
'owl:Nothing'(X):-
     'NSILCM'(X),'VNF'(X).
'owl:Nothing'(X):-
     'NSILCM'(X),'VNFD'(X).
'owl:Nothing'(X):-
     'NSILCM'(X),'VNFLCM'(X).
'owl:Nothing'(X):-
     'NSILCM'(X),'VNFR'(X).
'owl:Nothing'(X):-
     'NSLCM'(X),'NST'(X).
'owl:Nothing'(X):-
     'NSLCM'(X),'PDU'(X).
'owl:Nothing'(X):-
     'NSLCM'(X),'VDU'(X).
'owl:Nothing'(X):-
     'NSLCM'(X),'VDUR'(X).
'owl:Nothing'(X):-
     'NSLCM'(X),'VNF'(X).
'owl:Nothing'(X):-
     'NSLCM'(X),'VNFD'(X).
'owl:Nothing'(X):-
     'NSLCM'(X),'VNFLCM'(X).
'owl:Nothing'(X):-
     'NSLCM'(X),'VNFR'(X).
'owl:Nothing'(X):-
     'NST'(X),'PDU'(X).
'owl:Nothing'(X):-
     'NST'(X),'VDU'(X).
'owl:Nothing'(X):-
     'NST'(X),'VDUR'(X).
'owl:Nothing'(X):-
     'NST'(X),'VNF'(X).
'owl:Nothing'(X):-
     'NST'(X),'VNFD'(X).
'owl:Nothing'(X):-
     'NST'(X),'VNFLCM'(X).
'owl:Nothing'(X):-
     'NST'(X),'VNFR'(X).
'owl:Nothing'(X):-
     'PDU'(X),'VDU'(X).
'owl:Nothing'(X):-
     'PDU'(X),'VDUR'(X).
'owl:Nothing'(X):-
     'PDU'(X),'VNF'(X).
'owl:Nothing'(X):-
     'PDU'(X),'VNFD'(X).
'owl:Nothing'(X):-
     'PDU'(X),'VNFLCM'(X).
'owl:Nothing'(X):-
     'PDU'(X),'VNFR'(X).
'owl:Nothing'(X):-
     'VDU'(X),'VDUR'(X).
'owl:Nothing'(X):-
     'VDU'(X),'VNF'(X).
'owl:Nothing'(X):-
     'VDU'(X),'VNFD'(X).
'owl:Nothing'(X):-
     'VDU'(X),'VNFLCM'(X).
'owl:Nothing'(X):-
     'VDU'(X),'VNFR'(X).
'owl:Nothing'(X):-
     'VDUR'(X),'VNF'(X).
'owl:Nothing'(X):-
     'VDUR'(X),'VNFD'(X).
'owl:Nothing'(X):-
     'VDUR'(X),'VNFLCM'(X).
'owl:Nothing'(X):-
     'VDUR'(X),'VNFR'(X).
'owl:Nothing'(X):-
     'VNF'(X),'VNFD'(X).
'owl:Nothing'(X):-
     'VNF'(X),'VNFLCM'(X).
'owl:Nothing'(X):-
     'VNF'(X),'VNFR'(X).
'owl:Nothing'(X):-
     'VNFD'(X),'VNFLCM'(X).
'owl:Nothing'(X):-
     'VNFD'(X),'VNFR'(X).
'owl:Nothing'(X):-
     'VNFLCM'(X),'VNFR'(X).
% disjointClasses(['http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Namespace','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OCI']) 
'owl:Nothing'(X):-
     'Namespace'(X),'OCI'(X).
% disjointClasses(['http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Namespace','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualEnvironment']) 
'owl:Nothing'(X):-
     'Namespace'(X),'VirtualEnvironment'(X).
% disjointClasses(['http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OCI','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualEnvironment']) 
'owl:Nothing'(X):-
     'OCI'(X),'VirtualEnvironment'(X).
% disjointClasses(['http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#WiredNetworkInterface','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#WirelessNetworkInterface']) 
'owl:Nothing'(X):-
     'WiredNetworkInterface'(X),'WirelessNetworkInterface'(X).
% functionalProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isRunningOn') 
sameIndividuals(X,Y):-
     isRunningOn(Z,X),isRunningOn(Z,Y).
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#compute') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#connected') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#connectedByWire') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#deployedOnMachine') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#descriptionProperty') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#executionState') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#existsOn') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#has') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#hasDeploymentUnit') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#hasExecutionMachine') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#hasInstance') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#hasInterface') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#hasNetworkFunction') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#hasPhysicalInterface') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#hasVirtualInterface') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#interfaceProperty') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ipAddress') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isDeploymentUnitOf') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isDoing') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isExecuting') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isInstanceOf') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isInterfaceOf') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isOf') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isOn') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isPhysicalInterfaceOf') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isRunningOn') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isVirtualInterfaceOf') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#lacks') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#lacksExecutionMachine') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#lacksInstance') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#lacksPackage') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#macAddress') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#network') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#report') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#role') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#supports') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#supportsProtocol') 
% objectProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#target') 
% objectProperty('http://www.w3.org/2002/07/owl#topDataProperty') 
% ontology('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network') 
% symmetricProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#connected') 
connected(X,Y):-
     connected(Y,X).
% transitiveProperty('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#connected') 
connected(X,Y):-
     connected(X,Z),connected(Z,Y).
% classAssertion('http://www.w3.org/2000/01/rdf-schema#Datatype','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#executionState') 
'Datatype'('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#executionState').
% inverseProperties('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#hasDeploymentUnit','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isDeploymentUnitOf') 
hasDeploymentUnit(X,Y):-
     isDeploymentUnitOf(Y,X).
isDeploymentUnitOf(X,Y):-
     hasDeploymentUnit(Y,X).
% inverseProperties('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#hasInstance','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isInstanceOf') 
hasInstance(X,Y):-
     isInstanceOf(Y,X).
isInstanceOf(X,Y):-
     hasInstance(Y,X).
% inverseProperties('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#hasInterface','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isInterfaceOf') 
hasInterface(X,Y):-
     isInterfaceOf(Y,X).
isInterfaceOf(X,Y):-
     hasInterface(Y,X).
% inverseProperties('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isExecuting','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isRunningOn') 
isExecuting(X,Y):-
     isRunningOn(Y,X).
isRunningOn(X,Y):-
     isExecuting(Y,X).
% propertyDomain('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#spread','http://www.w3.org/2002/07/owl#Class') 
'Class'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#spread'(X,_).
% propertyDomain('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#target','http://www.w3.org/2002/07/owl#Class') 
'Class'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#target'(X,_).
% propertyRange('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#executionState','http://www.w3.org/2001/XMLSchema#string') 
string(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#executionState'(_,X).
% propertyRange('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#report',someValuesFrom('http://www.w3.org/2002/07/owl#topDataProperty','http://org.semanticweb.owlapi/error#Error1')) 
% propertyRange('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#spread','http://www.w3.org/2001/XMLSchema#integer') 
%integer(X):-
%'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#spread'(_,X).
% propertyRange('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#supportsProtocol','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Protocol') 
'Protocol'(X):-
     supportsProtocol(_,X).
% propertyRange('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#target','http://www.w3.org/2002/07/owl#Class') 
'Class'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#target'(_,X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Application','http://www.w3.org/2002/07/owl#Class') 
'Class'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Application'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#BGP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Protocol') 
'Protocol'(X):-
     'BGP'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#BackendFunction','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Function') 
'Function'(X):-
     'BackendFunction'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ClusterTemplate','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OpenstackTerm') 
'OpenstackTerm'(X):-
     'ClusterTemplate'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Component','http://www.w3.org/2002/07/owl#Class') 
'Class'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Component'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ComputeLimits','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OpenstackTerm') 
'OpenstackTerm'(X):-
     'ComputeLimits'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ComputeUsage','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OpenstackTerm') 
'OpenstackTerm'(X):-
     'ComputeUsage'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Container','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ExecutionEnvironment') 
'ExecutionEnvironment'(X):-
     'Container'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#DHCP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Protocol') 
'Protocol'(X):-
     'DHCP'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#DNS','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Protocol') 
'Protocol'(X):-
     'DNS'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#DatabaseFunction','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Function') 
'Function'(X):-
     'DatabaseFunction'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#DeploymentUnit','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualDevice') 
'VirtualDevice'(X):-
     'DeploymentUnit'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#DeploymentUnit',someValuesFrom('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isExecuting','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Application')) 
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Device','http://www.w3.org/2002/07/owl#Class') 
'Class'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Device'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Electricity','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Transmission') 
'Transmission'(X):-
     'Electricity'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ExecutionEnvironment','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualDevice') 
'VirtualDevice'(X):-
     'ExecutionEnvironment'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#FTP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Protocol') 
'Protocol'(X):-
     'FTP'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#FirewallFunction','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#MiddleboxFunction') 
'MiddleboxFunction'(X):-
     'FirewallFunction'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Flavor','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OpenstackTerm') 
'OpenstackTerm'(X):-
     'Flavor'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#FlavorAccess','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OpenstackTerm') 
'OpenstackTerm'(X):-
     'FlavorAccess'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#FloatingIP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OpenstackTerm') 
'OpenstackTerm'(X):-
     'FloatingIP'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Function','http://www.w3.org/2002/07/owl#Class') 
'Class'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Function'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#HTTP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Protocol') 
'Protocol'(X):-
     'HTTP'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#HTTPS','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Protocol') 
'Protocol'(X):-
     'HTTPS'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#HubFunction','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#MiddleboxFunction') 
'MiddleboxFunction'(X):-
     'HubFunction'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Hypervisor','http://www.w3.org/2002/07/owl#Class') 
'Class'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Hypervisor'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ICMP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Protocol') 
'Protocol'(X):-
     'ICMP'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ICMPv6','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ICMP') 
'ICMP'(X):-
     'ICMPv6'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IGMP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Protocol') 
'Protocol'(X):-
     'IGMP'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IMAP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Protocol') 
'Protocol'(X):-
     'IMAP'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Protocol') 
'Protocol'(X):-
     'IP'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IPNetwork','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Network') 
'Network'(X):-
     'IPNetwork'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IPOIB','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualNetworkInterface') 
'VirtualNetworkInterface'(X):-
     'IPOIB'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IPSec','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Protocol') 
'Protocol'(X):-
     'IPSec'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IPVLAN','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualNetworkInterface') 
'VirtualNetworkInterface'(X):-
     'IPVLAN'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IPVTAP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualNetworkInterface') 
'VirtualNetworkInterface'(X):-
     'IPVTAP'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IPv4','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IP') 
'IP'(X):-
     'IPv4'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IPv6','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IP') 
'IP'(X):-
     'IPv6'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#IRSenderReceiver','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Component') 
'Component'(X):-
     'IRSenderReceiver'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Image','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OpenstackTerm') 
'OpenstackTerm'(X):-
     'Image'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Interface','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Component') 
'Component'(X):-
     'Interface'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#InternalNetwork','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Network') 
'Network'(X):-
     'InternalNetwork'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#KVM','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Hypervisor') 
'Hypervisor'(X):-
     'KVM'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Keypair','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OpenstackTerm') 
'OpenstackTerm'(X):-
     'Keypair'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Kubernetes','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Orchestrator') 
'Orchestrator'(X):-
     'Kubernetes'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#LDAP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Protocol') 
'Protocol'(X):-
     'LDAP'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#LXD','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Hypervisor') 
'Hypervisor'(X):-
     'LXD'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#LinuxBridge','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualDevice') 
'VirtualDevice'(X):-
     'LinuxBridge'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#LoadBalanceFunction','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#MiddleboxFunction') 
'MiddleboxFunction'(X):-
     'LoadBalanceFunction'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Location','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OpenstackTerm') 
'OpenstackTerm'(X):-
     'Location'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#MAC','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Protocol') 
'Protocol'(X):-
     'MAC'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#MACVLAN','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualNetworkInterface') 
'VirtualNetworkInterface'(X):-
     'MACVLAN'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#MACVTAP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualNetworkInterface') 
'VirtualNetworkInterface'(X):-
     'MACVTAP'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#MACsec','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualNetworkInterface') 
'VirtualNetworkInterface'(X):-
     'MACsec'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#MagnumService','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OpenstackTerm') 
'OpenstackTerm'(X):-
     'MagnumService'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#MiddleboxFunction','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Function') 
'Function'(X):-
     'MiddleboxFunction'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#NLMON','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualNetworkInterface') 
'VirtualNetworkInterface'(X):-
     'NLMON'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#NSD','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OsmTerm') 
'OsmTerm'(X):-
     'NSD'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#NSILCM','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OsmTerm') 
'OsmTerm'(X):-
     'NSILCM'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#NSLCM','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OsmTerm') 
'OsmTerm'(X):-
     'NSLCM'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#NST','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OsmTerm') 
'OsmTerm'(X):-
     'NST'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#NTP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Protocol') 
'Protocol'(X):-
     'NTP'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Namespace','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Container') 
'Container'(X):-
     'Namespace'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Network','http://www.w3.org/2002/07/owl#Class') 
'Class'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Network'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Neutron','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Openstack') 
'Openstack'(X):-
     'Neutron'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Nova','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Openstack') 
'Openstack'(X):-
     'Nova'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OCI','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Container') 
'Container'(X):-
     'OCI'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ONAP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Orchestrator') 
'Orchestrator'(X):-
     'ONAP'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OS','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Device') 
'Device'(X):-
     'OS'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OSM','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Orchestrator') 
'Orchestrator'(X):-
     'OSM'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OSPF','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Protocol') 
'Protocol'(X):-
     'OSPF'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OpenVSwitch','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualDevice') 
'VirtualDevice'(X):-
     'OpenVSwitch'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Openstack','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Orchestrator') 
'Orchestrator'(X):-
     'Openstack'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OpenstackTerm','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Terms') 
'Terms'(X):-
     'OpenstackTerm'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Orchestrator','http://www.w3.org/2002/07/owl#Class') 
'Class'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Orchestrator'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OsmTerm','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Terms') 
'Terms'(X):-
     'OsmTerm'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OverlayNetwork','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Network') 
'Network'(X):-
     'OverlayNetwork'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PDU','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OsmTerm') 
'OsmTerm'(X):-
     'PDU'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#POP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Protocol') 
'Protocol'(X):-
     'POP'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PPP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Protocol') 
'Protocol'(X):-
     'PPP'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PTP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Protocol') 
'Protocol'(X):-
     'PTP'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Package','http://www.w3.org/2002/07/owl#Class') 
'Class'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Package'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PhysicalDevice','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Device') 
'Device'(X):-
     'PhysicalDevice'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PhysicalHub','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PhysicalDevice') 
'PhysicalDevice'(X):-
     'PhysicalHub'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PhysicalMachine','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PhysicalDevice') 
'PhysicalDevice'(X):-
     'PhysicalMachine'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PhysicalNetwork','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Network') 
'Network'(X):-
     'PhysicalNetwork'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PhysicalRouter','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PhysicalDevice') 
'PhysicalDevice'(X):-
     'PhysicalRouter'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PhysicalRouter','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#RouteFunction') 
'RouteFunction'(X):-
     'PhysicalRouter'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PhysicalSwitch','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PhysicalDevice') 
'PhysicalDevice'(X):-
     'PhysicalSwitch'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Protocol','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Transmission') 
'Transmission'(X):-
     'Protocol'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#RTSP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Protocol') 
'Protocol'(X):-
     'RTSP'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#RouteFunction','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#MiddleboxFunction') 
'MiddleboxFunction'(X):-
     'RouteFunction'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#SMTP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Protocol') 
'Protocol'(X):-
     'SMTP'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#SNMP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Protocol') 
'Protocol'(X):-
     'SNMP'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#SSH','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Protocol') 
'Protocol'(X):-
     'SSH'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#SecurityGroup','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OpenstackTerm') 
'OpenstackTerm'(X):-
     'SecurityGroup'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#SecurityGroupRule','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OpenstackTerm') 
'OpenstackTerm'(X):-
     'SecurityGroupRule'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Server','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OpenstackTerm') 
'OpenstackTerm'(X):-
     'Server'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ServerUsage','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OpenstackTerm') 
'OpenstackTerm'(X):-
     'ServerUsage'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Service','http://www.w3.org/2002/07/owl#Class') 
'Class'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Service'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ServiceFunctionChain','http://www.w3.org/2002/07/owl#Class') 
'Class'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ServiceFunctionChain'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Stack','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OpenstackTerm') 
'OpenstackTerm'(X):-
     'Stack'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#SwitchFunction','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#MiddleboxFunction') 
'MiddleboxFunction'(X):-
     'SwitchFunction'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#TCP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Protocol') 
'Protocol'(X):-
     'TCP'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#TLS/SSL','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Protocol') 
'Protocol'(X):-
     'TLS/SSL'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Terms','http://www.w3.org/2002/07/owl#Class') 
'Class'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Terms'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Transmission','http://www.w3.org/2002/07/owl#Class') 
'Class'(X):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Transmission'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#UDP','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Protocol') 
'Protocol'(X):-
     'UDP'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Unikernel','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ExecutionEnvironment') 
'ExecutionEnvironment'(X):-
     'Unikernel'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VCAN','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualNetworkInterface') 
'VirtualNetworkInterface'(X):-
     'VCAN'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VDU','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OsmTerm') 
'OsmTerm'(X):-
     'VDU'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VDUR','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OsmTerm') 
'OsmTerm'(X):-
     'VDUR'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VETH','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualNetworkInterface') 
'VirtualNetworkInterface'(X):-
     'VETH'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VLAN','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualNetworkInterface') 
'VirtualNetworkInterface'(X):-
     'VLAN'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VNF','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OsmTerm') 
'OsmTerm'(X):-
     'VNF'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VNFD','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OsmTerm') 
'OsmTerm'(X):-
     'VNFD'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VNFLCM','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OsmTerm') 
'OsmTerm'(X):-
     'VNFLCM'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VNFR','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OsmTerm') 
'OsmTerm'(X):-
     'VNFR'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VXCAN','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualNetworkInterface') 
'VirtualNetworkInterface'(X):-
     'VXCAN'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualDevice','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Device') 
'Device'(X):-
     'VirtualDevice'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualEnvironment','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Container') 
'Container'(X):-
     'VirtualEnvironment'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualMachine','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ExecutionEnvironment') 
'ExecutionEnvironment'(X):-
     'VirtualMachine'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualNetwork','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Network') 
'Network'(X):-
     'VirtualNetwork'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualNetworkInterface','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Interface') 
'Interface'(X):-
     'VirtualNetworkInterface'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Volume','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OpenstackTerm') 
'OpenstackTerm'(X):-
     'Volume'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VolumeType','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OpenstackTerm') 
'OpenstackTerm'(X):-
     'VolumeType'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VolumeTypeAccess','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#OpenstackTerm') 
'OpenstackTerm'(X):-
     'VolumeTypeAccess'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VxLAN','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#VirtualNetworkInterface') 
'VirtualNetworkInterface'(X):-
     'VxLAN'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Wire','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Component') 
'Component'(X):-
     'Wire'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#WiredNetwork','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PhysicalNetwork') 
'PhysicalNetwork'(X):-
     'WiredNetwork'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#WiredNetworkInterface','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Interface') 
'Interface'(X):-
     'WiredNetworkInterface'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#WirelessNetwork','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#PhysicalNetwork') 
'PhysicalNetwork'(X):-
     'WirelessNetwork'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#WirelessNetworkInterface','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Interface') 
'Interface'(X):-
     'WirelessNetworkInterface'(X).
% subClassOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Xen','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#Hypervisor') 
'Hypervisor'(X):-
     'Xen'(X).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#compute','http://www.w3.org/2002/07/owl#topObjectProperty') 
topObjectProperty(X,Y):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#compute'(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#connected','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#descriptionProperty') 
descriptionProperty(X,Y):-
     connected(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#connectedByWire','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#connected') 
connected(X,Y):-
     connectedByWire(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#deployedOnMachine','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#descriptionProperty') 
descriptionProperty(X,Y):-
     deployedOnMachine(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#descriptionProperty','http://www.w3.org/2002/07/owl#topObjectProperty') 
topObjectProperty(X,Y):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#descriptionProperty'(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#executionState','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#compute') 
compute(X,Y):-
     executionState(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#existsOn','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#descriptionProperty') 
descriptionProperty(X,Y):-
     existsOn(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#has','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#descriptionProperty') 
descriptionProperty(X,Y):-
     has(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#hasDeploymentUnit','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#has') 
has(X,Y):-
     hasDeploymentUnit(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#hasExecutionMachine','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#has') 
has(X,Y):-
     hasExecutionMachine(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#hasInstance','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#has') 
has(X,Y):-
     hasInstance(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#hasInterface','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#has') 
has(X,Y):-
     hasInterface(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#hasNetworkFunction','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#has') 
has(X,Y):-
     hasNetworkFunction(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#hasPhysicalInterface','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#hasInterface') 
hasInterface(X,Y):-
     hasPhysicalInterface(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#hasVirtualInterface','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#hasInterface') 
hasInterface(X,Y):-
     hasVirtualInterface(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#interfaceProperty','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#network') 
network(X,Y):-
     interfaceProperty(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#ipAddress','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#interfaceProperty') 
interfaceProperty(X,Y):-
     ipAddress(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isDeploymentUnitOf','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isOf') 
isOf(X,Y):-
     isDeploymentUnitOf(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isDoing','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#descriptionProperty') 
descriptionProperty(X,Y):-
     isDoing(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isExecuting','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isDoing') 
isDoing(X,Y):-
     isExecuting(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isInstanceOf','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isOf') 
isOf(X,Y):-
     isInstanceOf(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isInterfaceOf','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isOf') 
isOf(X,Y):-
     isInterfaceOf(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isOf','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#descriptionProperty') 
descriptionProperty(X,Y):-
     isOf(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isOn','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#descriptionProperty') 
descriptionProperty(X,Y):-
     isOn(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isPhysicalInterfaceOf','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isInterfaceOf') 
isInterfaceOf(X,Y):-
     isPhysicalInterfaceOf(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isRunningOn','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isOn') 
isOn(X,Y):-
     isRunningOn(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isVirtualInterfaceOf','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#isInterfaceOf') 
isInterfaceOf(X,Y):-
     isVirtualInterfaceOf(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#lacks','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#descriptionProperty') 
descriptionProperty(X,Y):-
     lacks(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#lacksExecutionMachine','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#lacks') 
lacks(X,Y):-
     lacksExecutionMachine(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#lacksInstance','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#lacks') 
lacks(X,Y):-
     lacksInstance(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#lacksPackage','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#lacks') 
lacks(X,Y):-
     lacksPackage(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#macAddress','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#interfaceProperty') 
interfaceProperty(X,Y):-
     macAddress(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#network','http://www.w3.org/2002/07/owl#topDataProperty') 
topDataProperty(X,Y):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#network'(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#report','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#descriptionProperty') 
descriptionProperty(X,Y):-
     report(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#role','http://www.w3.org/2002/07/owl#topDataProperty') 
topDataProperty(X,Y):-
     'http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#role'(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#supports','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#descriptionProperty') 
descriptionProperty(X,Y):-
     supports(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#supportsProtocol','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#supports') 
supports(X,Y):-
     supportsProtocol(X,Y).
% subPropertyOf('http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#target','http://raw.githubusercontent.com/Guilvareux/ontologies/main/network/network#descriptionProperty') 
descriptionProperty(X,Y):-
     target(X,Y).
