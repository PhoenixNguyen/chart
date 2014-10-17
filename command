curl -X POST "http://localhost:9200/dashboard/_search?pretty=true" -d '
{
    "query" : { "match_all" : {} },

    "facets" : {
        "published_on" : {
            "date_histogram" : {
                "field"    : "published",
                "interval" : "day",
                "field"    : "t"
            }
        }
    }
}
'

curl -X POST "http://localhost:9200/dashboard/_search?pretty=true" -d '
{
    "query" : { "match_all" : {} },

    "facets" : {
        "published_on" : {
            "date_histogram" : {
                "field"    : "published",
                "interval" : "day",
                "t" : "20"
            }
        },
        "wow_facet" : {
            "filter" : {
                "term" : { "t" : "20" }
            }
        }
    }
}
'

curl -X POST "http://localhost:9200/dashboard/_search?pretty=true" -d '
{
    "query" : { "match_all" : {} },

    "facets" : {
        "tags" : { 
	        "terms" : {
	        "field" : "tags", "size" : 10
	        } 
        }
    }
}
'

curl -X POST "http://localhost:9200/dashboard/article" -d '{ "t" : "18", "published" : "2011-01-22" }'
curl -X POST "http://localhost:9200/dashboard/article" -d '{ "t" : "19", "published" : "2011-01-23" }'
curl -X POST "http://localhost:9200/dashboard/article" -d '{ "t" : "20", "published" : "2011-01-24" }'


curl -X POST "http://localhost:9200/dashboard/_search?pretty=true" -d '
{
    "query" : {
        "match_all" : {}
    },
    "facets" : {
        "histo1" : {
            "histogram" : {
                "field" : "published",
                
                "interval" : "day",
                "facet": {
			          "terms": {
			            "field": "t"
			          }
			        }
            }
        }
    }
}
'
curl -X POST "http://localhost:9200/dashboard/_search?pretty=true" -d '
{
  "query": {
    "match_all": {}
  },
  "facets": {
    "pub_per_week": {
      "faceted_date_histogram": {
        "field": "published",
        "interval": "week",
        "facet": {
          "terms": {
            "field": "t"
          }
        }
      }
    }
  }
}
'
curl -X POST "http://localhost:9200/dashboard/_search?pretty=true" -d '
{
  "query": {
    "match_all": {}
  },
  "facets": {
    "published_on": {
      "date_histogram": {
        "field": "published",
        "interval": "date",
        "facet": {
          "terms": {
            "field": "t"
          }
        }
        
      }
    }
  }
}
'

curl -X POST "http://localhost:9200/dashboard/_search?pretty=true" -d '
{
  "query": {
    "match_all": {}
  },
  "facets": {
    "published_on": {
      "date_histogram": {
        "field": "published",
        "interval": "day",
        "facet": {
          "terms": {
            "field": "published"
          }
        }
        
      }
    }
  }
}
'

curl -X POST "http://localhost:9200/cardcdrs/_search?pretty=true" -d '
{
  "query": {
    "match_all": {}
  },
  "facets": {
    "published_on": {
      "date_histogram": {
        "field": "timestamp",
        "interval": "day",
        "facet": {
          "terms": {
            "field": "type"
          }
        }
        
      }
    }
  }
}
'

curl -X POST "http://localhost:9200/dashboard/_search?pretty=true" -d '
{
  "query": {
    "match_all": {}
  },
  "facets": {
    "published_on": {
      "date_histogram": {
        "field": "published",
        "interval": "day",

        "facet": {
          "terms": {
            "field": "t"
          }
        }
        
      }
    }
  }
}
'
curl -X POST "http://localhost:9200/dashboard/_search?pretty=true" -d '
{
  "query": {
    "match_all": {}
  },
  "facets": {
    "published_on": {
      "date_histogram": {
        "field": "published",
        "interval": "day"

        
        
      }
    },
    "facet": {
          "terms": {
            "field": "t"
          }
        }
  }
}
'

curl -X POST "http://localhost:9200/dashboard/_search?pretty=true" -d '
{
  "query": {
    "match_all": {}
  },
  "facets": {
    "published_on": {
      "date_histogram": {
        "field": "published",
        "interval": "day"

        
        
      }
    },
    "facet": {
          "terms": {
            "field": "t"
          }
        }
  }
}
'

,
        "facet": {
          "terms": {
            "field": "t"
          }
        }

curl -X POST "http://localhost:9200/dashboard/_search?pretty=true" -d '
{
    "query" : {
        "match_all" : {}
    },
    "facets" : {
        "histo1" : {
            "date_histogram" : {
                "key_field" : "published",
                
                "interval" : "day",
                
            },
            "terms": {
            "field": "t"
          }

        }

    }
}
'
"value_script" : "t",
* 2

//////////////////////////////////// function group and sum
curl -X POST "http://localhost:9200/dashboard/_search?pretty=true" -d '
{
    "query" : { "match_all" : {} },

    "facets" : {
        "published_on" : {
            "date_histogram" : {
                "field"    : "published",
                "interval" : "day",
                "t" : "20"
            }
        },
        "wow_facet" : {
            "filter" : {
                "term" : { "t" : "20" }
            }
        }
    }
}
'

"function_score": {
    "(query|filter)": {},
    "boost": "boost for the whole query",
    "functions": [
        {
            "filter": {},
            "FUNCTION": {}
        },
        {
            "FUNCTION": {}
        }
    ],
    "max_boost": number,
    "score_mode": "(multiply|max|...)",
    "boost_mode": "(multiply|replace|...)"
}


curl -X POST "http://localhost:9200/mo-index/_search?pretty=true" -d '
{
    "query" : { "match_all" : {} },
    "aggs" : {
        "max_price" : { "max" : { "field" : "amount" } }
    }

}
'

curl -X POST "http://localhost:9200/mo-index/_search?pretty=true" -d '
{
    "query" : { "match_all" : {} },
    "aggs" : {
        "intraday_return" : { "sum" : { "field" : "amount" } }
    }

}
'

curl -X POST "http://localhost:9200/mo-index/_search?pretty=true" -d '
{
  "aggs": {
    "mo_group": {
      "terms": {
        "field": "msisdn"
      },
      "aggs": {
        "mo_sum": {
          "sum": {
            "field": "amount"
          }
        }
      }
    }
  }
}
'

curl -X POST "http://localhost:9200/mo-index/_search?pretty=true" -d '
{
  "aggs": {
    "mo_group": {
      
    "terms": {
        "field": "msisdn"
      },
      "aggs": {
        "mo_sum": {
          "sum": {
            "field": "amount"
          }
        }
      }
    }
  }
}
'
