#ifndef STUDENTWORKCLASSES_HPP
#define STUDENTWORKCLASSES_HPP

#include <QFile>

#include "StudetsInfo.hpp"

namespace rating
{

    class StudentBinaryWork
    {
    public:

        short read(rating::Groups& groups, const QString& fileName) const
        {
            short key{};
            try
            {
                QFile file(fileName);
                if (!file.open(QIODevice::ReadOnly))
                    return 0;

                QDataStream in(&file);
                in.setVersion(QDataStream::Qt_6_8);
                if (in.atEnd() || in.status() != QDataStream::Ok)
                    return false;

                groups.clear();
                in >> key;
                loadGroups(groups, in);
            }
            catch (...)
            {
                return 0;
            }
            return key;
        }

    private:

        void loadGroups(Groups& grps, QDataStream& in) const
        {
            quint64 groupSize;//Число групп
            in >> groupSize;
            for (quint64 i = 0; i < groupSize; ++i)
            {
                QString key;
                in >> key;
                Group group;
                loadGroup(group, in);
                grps[key] = std::move(group);
            }
        }
        void loadGroup(Group& grp, QDataStream& in) const
        {
            quint64 studentCount;//Число студентов
            in >> studentCount;
            for (quint64 i = 0; i < studentCount; ++i)
            {
                QString key;
                in >> key;
                Student student;
                loadStudent(student, in);
                grp[key] = std::move(student);
            }
        }
        void loadStudent(Student& stud, QDataStream& in) const
        {
            quint64 infoCount;
            in >> infoCount;//число записей у студента
            for (quint64 i = 0; i < infoCount; ++i)
            {
                QString key, value;
                in >> key >> value;
                stud.push_back({ key, value });
            }
        }

    };

}

#endif // STUDENTWORKCLASSES_HPP
