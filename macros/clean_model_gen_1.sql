{% macro clean_model_gen() -%}
 
    {% set get_model_template %}
{% raw %}{{% endraw %}{% raw %}{{% endraw %}
    config(
        materialized='incremental',
        query_tag = var("system") ~ '_' ~ var("source") ~ '_' ~ var("division") ~ '_' ~ 'CLEAN',
        pre_hook = 'delete from {% raw %}{{% endraw %}{% raw %}{{% endraw %}this{% raw %}}{% endraw %}{% raw %}}{% endraw %} where division = \'{% raw %}{{% endraw %}{% raw %}{{% endraw %}var("division"){% raw %}}{% endraw %}{% raw %}}{% endraw %}\' and run_id = {% raw %}{{% endraw %}{% raw %}{{% endraw %} var("run_id") {% raw %}}{% endraw %}{% raw %}}{% endraw %}',
        tags=["tag_nm"]
    )
{% raw %}}{% endraw %}{% raw %}}{% endraw %}

    {% endset %}
     {{ get_model_template }}


   
{%- endmacro %}