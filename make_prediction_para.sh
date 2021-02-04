#!/usr/bin/env bash

PORT=$2
echo "Port: $PORT"

# POST method predict
curl -d '{  
   "CHAS":{  
      "0":0
   },
   "RM":{  
      "0":0.0
   },
   "TAX":{  
      "0":0.0
   },
   "PTRATIO":{  
      "0":0.0
   },
   "B":{  
      "0":0.0
   },
   "LSTAT":{  
      "0":0.00
   }
}'\
     -H "Content-Type: application/json" \
     -X POST http://$1:$PORT/predict
