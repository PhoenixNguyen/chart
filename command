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