{% from "neutron/map.jinja" import compute with context %}
{%- if compute.enabled %}

neutron_compute_packages:
  pkg.installed:
  - names: {{ compute.pkgs }}
<<<<<<< HEAD
=======

/etc/neutron/neutron.conf:
  file.managed:
  - source: salt://neutron/files/{{ compute.version }}/neutron-generic.conf.{{ grains.os_family }}
  - template: jinja
  - require:
    - pkg: neutron_compute_packages

{% if compute.dvr %}

neutron_dvr_packages:
  pkg.installed:
  - names:
    - neutron-l3-agent
    - neutron-metadata-agent

/etc/neutron/l3_agent.ini:
  file.managed:
  - source: salt://neutron/files/{{ compute.version }}/l3_agent.ini
  - template: jinja
  - watch_in:
    - service: neutron_compute_services
  - require:
    - pkg: neutron_compute_packages

/etc/neutron/metadata_agent.ini:
  file.managed:
  - source: salt://neutron/files/{{ compute.version }}/metadata_agent.ini
  - template: jinja
  - watch_in:
    - service: neutron_compute_services
  - require:
    - pkg: neutron_compute_packages

{% endif %}

/etc/neutron/plugins/ml2/openvswith_agent.ini:
  file.managed:
  - source: salt://neutron/files/{{ compute.version }}/openvswith_agent.ini
  - template: jinja
  - require:
    - pkg: neutron_compute_packages

neutron_compute_services:
  service.running:
  - names: {{ compute.services }}
  - enable: true
  - watch:
    - file: /etc/neutron/neutron.conf
    - file: /etc/neutron/plugins/ml2/openvswith_agent.ini
>>>>>>> 60aa25ad6d540ac9833fe7a4f4cad5bf3e025dde

/etc/neutron/l3_agent.ini:
  file.managed:
  - source: salt://neutron/files/{{ compute.version }}/l3_agent.ini
  - template: jinja
  - require:
    - pkg: neutron_compute_packages

/etc/neutron/plugins/ml2/openvswitch_agent.ini:
  file.managed:
  - source: salt://neutron/files/{{ compute.version }}/openvswitch_agent.ini
  - template: jinja
  - require:
    - pkg: neutron_compute_packages

/etc/neutron/metadata_agent.ini
  file.managed:
  - source: salt://neutron/files/{{ compute.version }}/metadata_agent.ini
  - template: jinja
  - require:
    - pkg: neutron_compute_packages

neutron_compute_services:
  service.running:
  - names: {{ compute.services }}
  - enable: true
  - watch:
    - file: /etc/neutron/l3_agent.ini
    - file: /etc/neutron/plugins/ml2/openvswitch_agent.ini
    - file: /etc/neutron/metadata_agent.ini
{%- endif %}