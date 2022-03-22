connection: "looker-private-demo"
#Removed all the comments

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

datagroup: ecommerce_etl {
  ### Datagroups Allow you to sync cache and Persisted Derived Tables to events like ETL
  #sql_trigger: select date_part(minute, current_timestamp());;
  sql_trigger: select true ;;
  max_cache_age: "1 minute"
}

persist_with: ecommerce_etl

explore: Orders {
  label: "4 Mile Trial Orders"
  from: order_items
}
