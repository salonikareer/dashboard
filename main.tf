resource "newrelic_one_dashboard" "exampledash" {
  name        = "New Relic Terraform "
  permissions = "public_read_only"

  page {
    name = "New Relic Saloni Terraform page"

    widget_billboard {
      title  = "Requests per minute."
      row    = 1
      column = 1
      width  = 3
      height = 3

      nrql_query {
        query = "FROM Transaction SELECT rate(count(*), 1 minute)"
      }
    }


    widget_bar {
      title  = "Average transaction duration, by application"
      row    = 1
      column = 4
      width  = 3
      height = 3

      nrql_query {
        account_id = 4038255
        query      = "FROM Transaction SELECT average(duration) FACET appName"
      }
    }

    widget_line {
      title  = "Average transaction duration and the request per minute, by application"
      row    = 1
      column = 7
      width  = 3
      height = 3

      nrql_query {
        account_id = 4038255
        query      = "FROM Transaction select max(duration) as 'max duration' where httpResponseCode = '504' timeseries since 5 minutes ago"
      }
    }
  }

  
}