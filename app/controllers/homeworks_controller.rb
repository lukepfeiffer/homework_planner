class HomeworksController < ApplicationController
  expose :homework
  expose :homeworks do
    Homework.all
  end
end
