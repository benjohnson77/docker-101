require 'serverspec'
require 'net/ssh'
require 'pathname'

def connect_to(image)
  require 'docker'
  Docker.url = ENV['DOCKER_HOST']

  containers = Docker::Container.all
  container_index = containers.find_index{|a| a.info['Image'] == image}
  container_id = containers[container_index].info['id']
  set :os, family: :debian
  set :backend, :docker
  set :docker_container, container_id
end
