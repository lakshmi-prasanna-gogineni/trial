connection: "thelook"

####

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

datagroup: ecommerce_etl {
  ### Datagroups Allow you to sync cache and Persisted Derived Tables to events like ETL
  #sql_trigger: select date_part(minute, current_timestamp());;
  sql_trigger: select true ;;
  max_cache_age: "1 minute"
}

persist_with: ecommerce_etl

explore: Orders {
  label: "4 Mile Trial Orders"
  from: users
  join: order_items {
   type: left_outer
  relationship: one_to_many
  sql_on: ${Orders.id}=${order_items.user_id} ;;
  }
}
