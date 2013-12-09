# Install the accumulo packages
install_accumulo:
  pkg:
    - installed
    - sources:
      - accumulo: {{ pillar.accumulo.rpm_url }}
      {% if pillar.accumulo.use_native_libraries %}
      - accumulo-native: {{ pillar.accumulo.native_libraries_rpm_url }}
      {% endif %}
  service.running:
    - name: accumulo

{% if not pillar.accumulo.use_native_libraries %}
accumulo-native:
  pkg:
    - removed
    - require:
      - pkg: install_accumulo
{% endif %}
