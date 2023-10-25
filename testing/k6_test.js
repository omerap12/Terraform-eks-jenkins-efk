import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
  vus: 800,
  duration: '10m',
};

export default function () {
  http.get('LOAD_BALANCER_URL');
  sleep(1);
}