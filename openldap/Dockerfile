FROM osixia/openldap

RUN sed -i "s/groupOfUniqueNames/groupOfNames/g" /container/service/slapd/assets/config/bootstrap/ldif/03-memberOf.ldif && \
    sed -i "s/uniqueMember/member/g" /container/service/slapd/assets/config/bootstrap/ldif/03-memberOf.ldif