FactoryGirl.define do
  factory :user do
    username "arto"
    sex "m"
    handedness "r"
    yearOfBirth "1983"
    education "peruskoulu"
  end

  factory :user2, class: User do
    username "maija"
    sex "f"
    handedness "l"
    yearOfBirth "1902"
    education "yo"
  end

  factory :list do
    filename "list1"
    training false
    active true
  end

  factory :trainingList, class: List do
    filename "treenilista"
    training true
    active true
  end

  factory :inactiveList, class: List do
    filename "treenilista"
    training false
    active false
  end

  factory :list2, class: List do
    filename "list2"
    training false
    active true
  end

  factory :list3, class: List do
    filename "list3"
    training false
    active true
  end

  factory :trainingNotFinished, class: Testcase do
    user_id 1
    list_id 1
    training true
    finished false
  end

  factory :trainingFinished, class: Testcase do
    user_id 1
    list_id 1
    training true
    finished true
  end

  factory :testcase do
    user_id 1
    list_id 1
    training true
    finished true
  end

  factory :testlog do
    testcase_id 1
    eventtype "test_event"
    value "666"
    timestamp 123454
  end

  factory :result do
    testcase_id 1
    keypressed "3"
    keypressindex 1
    last_series 0
    timestamp 123454
  end

  factory :admin do
    email "hello@world.com"
    password "Tsoha123"
    password_confirmation "Tsoha123"
  end

end