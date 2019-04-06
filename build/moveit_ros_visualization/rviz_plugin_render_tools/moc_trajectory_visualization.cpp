/****************************************************************************
** Meta object code from reading C++ file 'trajectory_visualization.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.5.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/moveit/moveit_ros/visualization/rviz_plugin_render_tools/include/moveit/rviz_plugin_render_tools/trajectory_visualization.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'trajectory_visualization.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.5.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_moveit_rviz_plugin__TrajectoryVisualization_t {
    QByteArrayData data[15];
    char stringdata0[343];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_moveit_rviz_plugin__TrajectoryVisualization_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_moveit_rviz_plugin__TrajectoryVisualization_t qt_meta_stringdata_moveit_rviz_plugin__TrajectoryVisualization = {
    {
QT_MOC_LITERAL(0, 0, 43), // "moveit_rviz_plugin::Trajector..."
QT_MOC_LITERAL(1, 44, 23), // "interruptCurrentDisplay"
QT_MOC_LITERAL(2, 68, 0), // ""
QT_MOC_LITERAL(3, 69, 31), // "changedDisplayPathVisualEnabled"
QT_MOC_LITERAL(4, 101, 34), // "changedDisplayPathCollisionEn..."
QT_MOC_LITERAL(5, 136, 21), // "changedRobotPathAlpha"
QT_MOC_LITERAL(6, 158, 18), // "changedLoopDisplay"
QT_MOC_LITERAL(7, 177, 16), // "changedShowTrail"
QT_MOC_LITERAL(8, 194, 20), // "changedTrailStepSize"
QT_MOC_LITERAL(9, 215, 22), // "changedTrajectoryTopic"
QT_MOC_LITERAL(10, 238, 23), // "changedStateDisplayTime"
QT_MOC_LITERAL(11, 262, 17), // "changedRobotColor"
QT_MOC_LITERAL(12, 280, 17), // "enabledRobotColor"
QT_MOC_LITERAL(13, 298, 37), // "trajectorySliderPanelVisibili..."
QT_MOC_LITERAL(14, 336, 6) // "enable"

    },
    "moveit_rviz_plugin::TrajectoryVisualization\0"
    "interruptCurrentDisplay\0\0"
    "changedDisplayPathVisualEnabled\0"
    "changedDisplayPathCollisionEnabled\0"
    "changedRobotPathAlpha\0changedLoopDisplay\0"
    "changedShowTrail\0changedTrailStepSize\0"
    "changedTrajectoryTopic\0changedStateDisplayTime\0"
    "changedRobotColor\0enabledRobotColor\0"
    "trajectorySliderPanelVisibilityChange\0"
    "enable"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_moveit_rviz_plugin__TrajectoryVisualization[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
      12,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   74,    2, 0x0a /* Public */,
       3,    0,   75,    2, 0x08 /* Private */,
       4,    0,   76,    2, 0x08 /* Private */,
       5,    0,   77,    2, 0x08 /* Private */,
       6,    0,   78,    2, 0x08 /* Private */,
       7,    0,   79,    2, 0x08 /* Private */,
       8,    0,   80,    2, 0x08 /* Private */,
       9,    0,   81,    2, 0x08 /* Private */,
      10,    0,   82,    2, 0x08 /* Private */,
      11,    0,   83,    2, 0x08 /* Private */,
      12,    0,   84,    2, 0x08 /* Private */,
      13,    1,   85,    2, 0x08 /* Private */,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Bool,   14,

       0        // eod
};

void moveit_rviz_plugin::TrajectoryVisualization::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        TrajectoryVisualization *_t = static_cast<TrajectoryVisualization *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->interruptCurrentDisplay(); break;
        case 1: _t->changedDisplayPathVisualEnabled(); break;
        case 2: _t->changedDisplayPathCollisionEnabled(); break;
        case 3: _t->changedRobotPathAlpha(); break;
        case 4: _t->changedLoopDisplay(); break;
        case 5: _t->changedShowTrail(); break;
        case 6: _t->changedTrailStepSize(); break;
        case 7: _t->changedTrajectoryTopic(); break;
        case 8: _t->changedStateDisplayTime(); break;
        case 9: _t->changedRobotColor(); break;
        case 10: _t->enabledRobotColor(); break;
        case 11: _t->trajectorySliderPanelVisibilityChange((*reinterpret_cast< bool(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObject moveit_rviz_plugin::TrajectoryVisualization::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_moveit_rviz_plugin__TrajectoryVisualization.data,
      qt_meta_data_moveit_rviz_plugin__TrajectoryVisualization,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *moveit_rviz_plugin::TrajectoryVisualization::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *moveit_rviz_plugin::TrajectoryVisualization::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_moveit_rviz_plugin__TrajectoryVisualization.stringdata0))
        return static_cast<void*>(const_cast< TrajectoryVisualization*>(this));
    return QObject::qt_metacast(_clname);
}

int moveit_rviz_plugin::TrajectoryVisualization::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 12)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 12;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 12)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 12;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
