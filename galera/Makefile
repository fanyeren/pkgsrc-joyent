# $NetBSD$

DISTNAME=	galera-25.3.5-src
PKGNAME=	${MYSQL_PKG_PREFIX}-${DISTNAME:S/-src//}
CATEGORIES=	databases
MASTER_SITES=	http://launchpad.net/galera/3.x/25.3.5/+download/

MAINTAINER=	filip@joyent.com
HOMEPAGE=	http://www.codership.com/
COMMENT=	Synchronous Multi-Master replication plugin for MySQL
LICENSE=	gnu-gpl-v3

BUILD_DEPENDS+=	scons-[0-9]*:../../devel/scons

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

MAKE_ENV+=	CPPFLAGS=-I${PREFIX}/include
MAKE_ENV+=	LIBPATH=${PREFIX}/lib
MAKE_ENV+=	RPATH=${PREFIX}/lib
LDFLAGS+=	${COMPILER_RPATH_FLAG}${PREFIX}/lib

CHECK_PORTABILITY_SKIP+=	scripts/mysql/*
INSTALLATION_DIRS+=		lib/mysql/plugin

do-configure:
do-build:
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} scons strict_build_flags=0 tests=0

do-install:
	${INSTALL_LIB} ${WRKSRC}/libgalera_smm.so ${DESTDIR}${PREFIX}/lib/mysql/plugin/

.include "../../devel/boost-build/buildlink3.mk"
.include "../../devel/boost-headers/buildlink3.mk"
.include "../../devel/boost-libs/buildlink3.mk"
.include "../../devel/check/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../mk/mysql.buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
