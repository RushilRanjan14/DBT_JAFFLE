{# A basic example for a project-wide macro to cast a column uniformly #}

{% macro dollars_to_rupees(column_name) -%}
    {{ return(adapter.dispatch('dollars_to_rupees')(column_name)) }}
{%- endmacro %}

{% macro default__dollars_to_rupees(column_name) -%}
    ({{ column_name }} )*83::numeric(16, 2)
{%- endmacro %}

{% macro postgres__dollars_to_rupees(column_name) -%}
    ({{ column_name }}::numeric(16, 2))*83
{%- endmacro %}

{% macro bigquery__dollars_to_rupees(column_name) %}
    round(cast(({{ column_name }})*83 as numeric), 2)
{% endmacro %}
