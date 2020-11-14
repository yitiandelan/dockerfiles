FROM osixia/openldap:latest

RUN cd /container/service/slapd/assets/config/bootstrap/ldif \
    && sed -i "s/groupOfUniqueNames/groupOfNames/g" 03-memberOf.ldif \
    && sed -i "s/uniqueMember/member/g" 03-memberOf.ldif
