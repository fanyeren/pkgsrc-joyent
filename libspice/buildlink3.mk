# $NetBSD$

BUILDLINK_TREE+=	libspice

.if !defined(LIBSPICE_BUILDLINK3_MK)
LIBSPICE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libspice+=	libspice>=0.12
BUILDLINK_PKGSRCDIR.libspice?=	../../joyent/libspice
pkgbase:= libspice
.  include "../../mk/pkg-build-options.mk"

.endif # LIBSPICE_BUILDLINK3_MK

BUILDLINK_TREE+=	-libspice
