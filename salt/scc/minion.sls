{% if ( 'minion' in grains.get('roles') or 'sshminion' in grains.get('roles') ) and grains.get('sles_registration_code') and '15' in grains['osrelease'] %}

register_sles_server:
   cmd.run:
     - name: SUSEConnect --url https://scc.suse.com -r {{ grains.get("sles_registration_code") }} -p SLES/{{ grains['osrelease'] }}/x86_64

basesystem_activation:
   cmd.run:
     - name: SUSEConnect -p sle-module-basesystem/{{ grains['osrelease'] }}/x86_64

{% endif %}
