FROM ave2/allelic-variation-explorer
MAINTAINER Stefan Verhoeven "s.verhoeven@esciencecenter.nl"

COPY data /data

ADD entrypoint.sh /bin/entrypoint.sh

RUN service nginx start && \
    sleep 2 && \
    # For some reason /meta dir empty after build, so set db to default loc ./ave.db
    echo "WHOOSH_BASE_DIR='/whoosh'" > settings.cfg && \
    avedata register \
    --species 'Solanum Lycopersicum' \
    --genome SL.2.40 \
    --datatype 2bit \
    http://localhost/data/S_lycopersicum_chromosomes.2.40.chr6-0-100000.2bit && \
    avedata register \
    --species 'Solanum Lycopersicum' \
    --genome SL.2.40 \
    --datatype variants \
    /data/tomato_snps.chr6-0-100000.bcf && \
    avedata register \
    --species 'Solanum Lycopersicum' \
    --genome SL.2.40 \
    --datatype genes \
    http://localhost/data/S_lycopersicum_May_2012.chr6-0-100000.bb && \
    avedata register \
    --species 'Solanum Lycopersicum' \
    --genome SL.2.40 \
    --datatype features \
    http://localhost/data/A-AFFY-87.bb && \
    service nginx stop

ENTRYPOINT ["/bin/entrypoint.sh"]

CMD service nginx start && gunicorn -w 4 --threads 2 -t 60 -b 127.0.0.1:8080 avedata.app:app
