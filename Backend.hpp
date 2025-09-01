#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>

#if (defined (_WIN32) || defined (_WIN64))
#include <QUrl>
#endif

#include "StudentWorkClasses.hpp"
#include "DataEncoder.hpp"

class Backend : public QObject
{
    Q_OBJECT
public:
    explicit Backend(QObject *parent = nullptr) : QObject(parent) {}

    Q_INVOKABLE bool    openFile(const QString &filePath)
    {
        #if (defined (_WIN32) || defined (_WIN64))
            QString cleanPath = QUrl(filePath).toLocalFile();
            if(!cleanPath.contains(".bin"))
                return false;
        #else
            QString cleanPath = filePath;
        #endif


        rating::StudentBinaryWork reder;

        int key = reder.read(_groups, cleanPath);
        rating::InfoEncoder decoder(key);

        decoder.decode(_groups);
        return !_groups.empty();
    }
    Q_INVOKABLE bool    autorezite(const QString& password)
    {
        QString grps = parseLoginPassword(password);

        auto found1 = _groups.find(grps);
        if (found1 == _groups.end())
            return false;
        rating::Group& group = found1->second;

        auto found2 = group.find(password);
        if (found2 == group.end())
            return false;

        _student = &(found2->second);
        findIndexs();
        return true;
    }

    Q_INVOKABLE bool    fileParsed() const
    {
        return !_groups.empty();
    }

    Q_INVOKABLE QString getNames() const
    {
        QString res;
        if(_student == nullptr)
            return res;
        rating::Student& student = *_student;
        for(size_t i = 0; i < indBeginPractic; ++i)
            res += student[i].first + '\n';
        return res;
    }
    Q_INVOKABLE QString getInfo() const
    {
        QString res;
        if(_student == nullptr)
            return res;
        rating::Student& student = *_student;
        for(size_t i = 0; i < indBeginPractic; ++i)
            res += (student[i].second.isEmpty() ? "..." : student[i].second) + '\n';
        return res;
    }

    Q_INVOKABLE QString getPracticInfo()
    {
        QString res = "Практики\n";
        if(_student == nullptr)
            return res;
        rating::Student& student = *_student;
        size_t ind = 1;
        for (size_t i = indBeginPractic; i + 1 < student.size() && i + 1 < indBeginRGZ; i += 2, ++ind)
        {
            res += QString::number(ind) + ':';
            if(!student[i].second.isEmpty())
                res += "H";
            else
                res += " ";
            res += " - " + (student[i + 1].second.isEmpty() ? "..." : student[i + 1].second) + '\n';
        }
        return res;
    }
    Q_INVOKABLE QString getPracticRGZ()
    {
        QString res = "РГЗ\n";
        if(_student == nullptr)
            return res;
        rating::Student& student = *_student;
        size_t ind = 1;
        for (size_t i = indBeginRGZ; i + 1 < student.size(); ++i, ++ind)
            res += QString::number(ind) + " - " + (student[i].second.isEmpty() ? "..." : student[i].second) + '\n';
        return res;
    }

private:

    rating::Groups _groups;
    rating::Student* _student;

    size_t indBeginPractic{};
    size_t indBeginRGZ{};

private:

    Q_INVOKABLE bool isNum(const QString& str) const
    {
        for (const auto& i : str)
            if (i < '0' || i > '9')
                return false;
        return true;
    }

    Q_INVOKABLE QString parseLoginPassword(const QString& str) const
    {
        for(const auto& [key, value] : _groups)
        {
            qsizetype ind = key.indexOf('-');
            if(ind == -1)
                continue;
            QString number = key.mid(ind + 1);
            if(qsizetype index = str.indexOf(number); index != -1)
                return key;
        }
        return "";
    }

    Q_INVOKABLE void findIndexs()
    {
        if(_student == nullptr)
            return;
        rating::Student& student = *_student;
        size_t i = 0;
        for(; i < student.size(); ++i)
            if (isNum(student[i].first))
            {
                indBeginPractic = i;
                break;
            }
        while (i < student.size() && isNum(student[i].first))
            ++i;
        indBeginRGZ = i;
    }

};

#endif // BACKEND_H
