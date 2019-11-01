<!DOCTYPE html>

{# NexT version #}
{%- set version = next_env('version') %}

{# Language & Config #}
{%- set title = __('title') !== 'title' and __('title') or config.title %}
{%- set subtitle = __('subtitle') !== 'subtitle' and __('subtitle') or config.subtitle %}
{%- set author = __('author') !== 'author' and __('author') or config.author %}
{%- set description = __('description') !== 'description' and __('description') or config.description %}

{%- if theme.pjax %}
  {%- set pjax = ' pjax' %}
{%- endif %}

<html lang="{{ config.language }}">
<head>
  {{ partial('_partials/head/head.swig', {}, {cache: theme.cache.enable}) }}
  {% include '_partials/head/head-unique.swig' %}
  {{- next_inject('head') }}
  <title>{% block title %}{% endblock %}</title>
  {{ partial('_third-party/analytics/index.swig', {}, {cache: theme.cache.enable}) }}
  {{ partial('_scripts/noscript.swig', {}, {cache: theme.cache.enable}) }}
  <style>
    span.line.tuture-add {
      font-weight: bold;
    }

    span.line.tuture-del {
      opacity: 0.3;
    }

    .profileBox {
      display: flex;
      flex-direction: row;
      justify-content: center;
      align-items: center;
      flex-wrap: wrap;
    }

    .profileBox i {
      display: none;
    }

    .profileBox p {
      margin: 0;
      padding: 0;
    }

    .avatarBox {
      min-width: 60px;
    }

    .avatarBox .avatar {
      width: 60px;
      height: 60px;
      border-radius: 50%;
      margin: 0;
    }

    .avatarBox .avatar:hover {
      cursor: pointer;
    }

    .avatarBox {
      margin-right: 20px;
    }

    .rightBox {
      display:flex;
      flex-direction: row;
      justify-content: flex-start;
      align-items: center;
    }

    .infoBox {
      min-width: 100px;
    }

    .infoBox p {
      padding: 0;
      margin: 0;
    }

    .infoBox .nickName {
      font-weight: bold;
      font-size: 20px;
      color: #979797;
      text-decoration: none;
    }

    .infoBox .nickName:hover {
      cursor: pointer;
    }

    .infoBox .motto {
      font-size: 16px;
      color: #979797;
    }

    .codeBox {
      margin-left: 49px;
      min-width: 100px;
    }

    .codeBox a {
      text-decoration: none;
    }

    .codeBox .exturl {
      border: none;
    }

    .codeBox span.codeText {
      display: inline-block;
      width: 100px;
      height: 40px;
      border-radius: 4px;
      border: 1px solid #979797;
      color: #979797;
      text-align: center;
      line-height: 40px;
      text-decoration: none;;
      transition: all 0.2s ease-in-out;
    }

    .codeBox .codeText:hover {
      cursor: pointer;
      background-color: #979797;
      color: #ffffff;
    }

    @media screen and (max-width:652px) {
      .profileBox {
        align-items: flex-start;
      }

      .infoBox {
        margin-bottom: 20px;
      }

      .rightBox {
        flex-direction: column;
        align-items: flex-start;
      }

      .codeBox {
        margin-left: 0;
      }
    }

    @media screen and (max-width:500px) {
      .rightBox {
        align-items: center;
      }

      .infoBox {
        margin-top: 20px;
        margin-bottom: 20px;
      }

      .infoBox .nickName {
        text-align: center;
      }

      .infoBox .motto {
        text-align: center;
      }
    }

    .vsys {
      display:none !important;
      }
  </style>
  <link rel="stylesheet" href="//cdn.jsdelivr.net/gh/highlightjs/cdn-release@9.15.10/build/styles/default.min.css">
  <script data-ad-client="ca-pub-9380061057176058" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
</head>

<body itemscope itemtype="http://schema.org/WebPage" lang="{{ page.lang or page.language or config.language }}">
  <div class="container{%- if theme.motion.enable %} use-motion{%- endif %}">
    <div class="headband"></div>

    <header id="header" class="header" itemscope itemtype="http://schema.org/WPHeader">
      <div class="header-inner">{% include '_partials/header/index.swig' %}</div>
    </header>

    {{ partial('_partials/widgets.swig', {}, {cache: theme.cache.enable}) }}

    <main id="main" class="main">
      <div class="main-inner">
        <div class="content-wrap">
          {%- if theme.scheme === 'Pisces' or theme.scheme === 'Gemini' %}
            {% include '_partials/header/sub-menu.swig' %}
          {%- endif %}
          <div id="content" class="content">
            {% block content %}{% endblock %}
          </div>
          {% include '_partials/comments.swig' %}
        </div>
        {%- if theme.sidebar.display !== 'remove' %}
          {% block sidebar %}{% endblock %}
        {%- endif %}
      </div>
    </main>

    <footer id="footer" class="footer">
      <div class="footer-inner">
        {{ partial('_partials/footer.swig', {}, {cache: theme.cache.enable}) }}
        {{ partial('_partials/analytics/index.swig', {}, {cache: theme.cache.enable}) }}
        {% block footer %}{% endblock %}
      </div>
    </footer>
  </div>

  {{ partial('_scripts/index.swig', {}, {cache: theme.cache.enable}) }}
  {{ partial('_third-party/index.swig', {}, {cache: theme.cache.enable}) }}

  {%- if theme.pjax %}
    <div id="pjax">
  {%- endif %}

  {% include '_third-party/math/index.swig' %}
  {% include '_third-party/quicklink.swig' %}
  {% include '_third-party/vkontakte-api.swig' %}

  {{- next_inject('bodyEnd') }}

  <script>
    const line = document.getElementsByClassName('line');
    const arrLine = Array.from(line);

    const delRegex = /\[.*tuture.*-.*del.*\]/;
    const addRegex = /\[.*tuture.*-.*add.*\]/
    const omitRegex = /\[.*tuture.*-.*omit.*\]/

    arrLine.map(item => {
      if (item.innerText.startsWith('[tuture-add]')) {
          item.innerHTML = item.innerHTML.replace(addRegex, '');
          item.className = item.className + ' tuture-add';
      } else if (item.innerText.startsWith('[tuture-del]')) {
          item.innerHTML = item.innerHTML.replace(delRegex, '');
          item.className = item.className + ' tuture-del';
      } else if (item.innerText.startsWith('[tuture-omit]')) {
        item.innerHTML = item.innerHTML.replace(omitRegex, '...');
        item.className = item.className + ' tuture-omit';
      }
    })
  </script>
</body>
</html>
