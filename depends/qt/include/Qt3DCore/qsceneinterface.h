/****************************************************************************
**
** Copyright (C) 2014 Klaralvdalens Datakonsult AB (KDAB).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the Qt3D module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL3$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see http://www.qt.io/terms-conditions. For further
** information use the contact form at http://www.qt.io/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 3 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPLv3 included in the
** packaging of this file. Please review the following information to
** ensure the GNU Lesser General Public License version 3 requirements
** will be met: https://www.gnu.org/licenses/lgpl.html.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 2.0 or later as published by the Free
** Software Foundation and appearing in the file LICENSE.GPL included in
** the packaging of this file. Please review the following information to
** ensure the GNU General Public License version 2.0 requirements will be
** met: http://www.gnu.org/licenses/gpl-2.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

#ifndef QT3D_QSCENEINTERFACE_H
#define QT3D_QSCENEINTERFACE_H

#include <Qt3DCore/qt3dcore_global.h>
#include <QObject>
#include <Qt3DCore/qnodeid.h>

QT_BEGIN_NAMESPACE

class QUuid;

namespace Qt3D {

class QNode;
class QObservableInterface;
class QLockableObserverInterface;

typedef QList<QObservableInterface *> QObservableList;

class QT3DCORESHARED_EXPORT QSceneInterface
{
public:
    virtual ~QSceneInterface() {}
    virtual void addObservable(QObservableInterface *observable, const QNodeId &id) = 0;
    virtual void addObservable(QNode *observable) = 0;
    virtual void removeObservable(QObservableInterface *observable, const QNodeId &id) = 0;
    virtual void removeObservable(QNode *observable) = 0;
    virtual QObservableList lookupObservables(const QNodeId &id) const = 0;
    virtual QNode *lookupNode(const QNodeId &id) const = 0;
    virtual QNodeId nodeIdFromObservable(QObservableInterface *observable) const = 0;
    virtual void setArbiter(QLockableObserverInterface *arbiter) = 0;

    virtual QList<QNodeId> entitiesForComponent(const QNodeId &componentUuid) const = 0;
    virtual void addEntityForComponent(const QNodeId &componentUuid, const QNodeId &entityUuid) = 0;
    virtual void removeEntityForComponent(const QNodeId &componentUuid, const QNodeId &entityUuid) = 0;
};

} // Qt3D

QT_END_NAMESPACE

Q_DECLARE_METATYPE(Qt3D::QSceneInterface *)

#endif // QSCENEINTERFACE_H
