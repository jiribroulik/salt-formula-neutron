{% from "neutron/map.jinja" import gateway with context %}
{%- if gateway.enabled %}

neutron_gateway_packages:
  pkg.installed:
  - names: {{ gateway.pkgs }}

<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> f747f362d25a391f5ff70c5d583a58e528951ccc
/etc/neutron/neutron.conf:
  file.managed:
  - source: salt://neutron/files/{{ gateway.version }}/neutron-generic.conf.{{ grains.os_family }}
  - template: jinja
  - require:
    - pkg: neutron_gateway_packages

<<<<<<< HEAD
>>>>>>> 60aa25ad6d540ac9833fe7a4f4cad5bf3e025dde
=======
>>>>>>> f747f362d25a391f5ff70c5d583a58e528951ccc
/etc/neutron/l3_agent.ini:
  file.managed:
  - source: salt://neutron/files/{{ gateway.version }}/l3_agent.ini
  - template: jinja
  - require:
    - pkg: neutron_gateway_packages

/etc/neutron/dhcp_agent.ini:
  file.managed:
  - source: salt://neutron/files/{{ gateway.version }}/dhcp_agent.ini
<<<<<<< HEAD
<<<<<<< HEAD
  - template: jinja
  - require:
    - pkg: neutron_gateway_packages

/etc/neutron/plugins/ml2/openvswitch_agent.ini:
  file.managed:
  - source: salt://neutron/files/{{ gateway.version }}/openvswitch_agent.ini
=======
=======
>>>>>>> f747f362d25a391f5ff70c5d583a58e528951ccc
  - require:
    - pkg: neutron_gateway_packages

/etc/neutron/metadata_agent.ini:
  file.managed:
  - source: salt://neutron/files/{{ gateway.version }}/metadata_agent.ini
<<<<<<< HEAD
>>>>>>> 60aa25ad6d540ac9833fe7a4f4cad5bf3e025dde
=======
>>>>>>> f747f362d25a391f5ff70c5d583a58e528951ccc
  - template: jinja
  - require:
    - pkg: neutron_gateway_packages

<<<<<<< HEAD
<<<<<<< HEAD
/etc/neutron/metadata_agent.ini
  file.managed:
  - source: salt://neutron/files/{{ gateway.version }}/metadata_agent.ini
=======
/etc/neutron/plugins/ml2/openvswith_agent.ini:
  file.managed:
  - source: salt://neutron/files/{{ gateway.version }}/openvswith_agent.ini
>>>>>>> 60aa25ad6d540ac9833fe7a4f4cad5bf3e025dde
=======
/etc/neutron/plugins/ml2/openvswith_agent.ini:
  file.managed:
  - source: salt://neutron/files/{{ gateway.version }}/openvswith_agent.ini
>>>>>>> f747f362d25a391f5ff70c5d583a58e528951ccc
  - template: jinja
  - require:
    - pkg: neutron_gateway_packages

neutron_gateway_services:
  service.running:
  - names: {{ gateway.services }}
  - enable: true
  - watch:
<<<<<<< HEAD
<<<<<<< HEAD
    - file: /etc/neutron/l3_agent.ini
    - file: /etc/neutron/dhcp_agent.ini
    - file: /etc/neutron/plugins/ml2/openvswitch_agent.ini
    - file: /etc/neutron/metadata_agent.ini
=======
=======
>>>>>>> f747f362d25a391f5ff70c5d583a58e528951ccc
    - file: /etc/neutron/neutron.conf
    - file: /etc/neutron/l3_agent.ini
    - file: /etc/neutron/metadata_agent.ini
    - file: /etc/neutron/plugins/ml2/openvswith_agent.ini
    - file: /etc/neutron/dhcp_agent.ini
<<<<<<< HEAD
>>>>>>> 60aa25ad6d540ac9833fe7a4f4cad5bf3e025dde
=======
>>>>>>> f747f362d25a391f5ff70c5d583a58e528951ccc

{%- endif %}