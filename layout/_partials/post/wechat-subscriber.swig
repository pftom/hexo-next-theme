<div id="qrcode_subscriber-container">
  <div>{{ theme.wechat_subscriber.description }}</div>

  <div id="qrocde-qr">
    {%- for name, image in theme.qrcode_subscriber %}
      {%- set builtin = ['wechat', 'qq_group'] %}
      {%- if builtin.includes(name) %}
        {%- set translation = __('qrcode.' + name) %}
      {% else %}
        {%- set translation = name %}
      {%- endif %}
      <div style="display: inline-block">
        <img src="{{ url_for(image) }}" alt="{{ author }} {{ translation }}">
        <p>{{ translation }}</p>
      </div>
    {%- endfor %}

  </div>
</div>
