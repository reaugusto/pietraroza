import { createClient } from 'https://cdn.jsdelivr.net/npm/@supabase/supabase-js/+esm'

const supabaseUrl = 'https://kbrnvfdbmzdrcwbwiluo.supabase.co';
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imticm52ZmRibXpkcmN3YndpbHVvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUzMzMwNjIsImV4cCI6MjA5MDkwOTA2Mn0.ZwJ_MKc6OOHq6bJjDh0EKFSxTVQ6E_Pz-9xg_IMBkvU';
export const supabase = createClient(supabaseUrl, supabaseKey);
